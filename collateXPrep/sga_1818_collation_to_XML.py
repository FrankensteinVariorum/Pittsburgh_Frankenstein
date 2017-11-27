from collatex import *
from xml.dom import pulldom
import re
import glob
from datetime import datetime, date
# 2017-11-26 ebb: processing only ms to 1818 collation, hoping it outputs @type="invariant" on app elements
# import pytz
# from tzlocal import get_localzone

# today = date.today()
# utc_dt = datetime(today, tzinfo=pytz.utc)
# dateTime = utc_dt.astimezone(get_localzone())
# strDateTime = str(dateTime)

now = datetime.utcnow()
nowStr = str(now)

regexWhitespace = re.compile(r'\s+')
regexNonWhitespace = re.compile(r'\S+')
regexEmptyTag = re.compile(r'/>$')
regexBlankLine = re.compile(r'\n{2,}')
regexLeadingBlankLine = re.compile(r'^\n')
regexPageBreak = re.compile(r'<pb.+?/>')
RE_MARKUP = re.compile(r'<.+?>')

# Element types: xml, div, head, p, hi, pb, note, lg, l; comment()
# Tags to ignore, with content to keep: xml, comment, anchor
# Structural elements: div, p, lg, l
# Inline elements (empty) retained in normalization: pb, milestone, xi:include
# Inline and block elements (with content) retained in normalization: note, hi, head, ab

# GIs fall into one three classes
# 2017-05-21 ebb: Due to trouble with pulldom parsing XML comments, I have converted these to comment elements,
# 2017-05-21 ebb: to be ignored during collation.
# 2017-05-30 ebb: Determined that comment elements cannot really be ignored when they have text nodes (the text is
# 2017-05-30 ebb: collated but the tags are not). Decision to make the comments into self-closing elements with text
# 2017-05-30 ebb: contents as attribute values, and content such as tags simplified to be legal attribute values.
# 2017-05-22 ebb: I've set anchor elements with @xml:ids to be the indicators of collation "chunks" to process together
ignore = ['sourceDoc', 'xml', 'pb', 'comment', 'w', 'mod']
inlineEmpty = ['milestone', 'anchor', 'include', 'lb', 'delSpan', 'addSpan', 'gap', 'handShift', 'damage', 'restore']
inlineContent = ['hi', 'add', 'del', 'metamark', 'unclear', 'retrace', 'damage', 'restore', 'zone']
blockElement = ['p', 'div', 'lg', 'l', 'head', 'note', 'ab', 'cit', 'quote', 'bibl', 'header', 'surface', 'graphic']
# ebb: Tried removing 'comment', from blockElement list above, because we don't want these to be collated.

# 10-23-2017 ebb rv:

def normalizeSpace(inText):
    """Replaces all whitespace spans with single space characters"""
    if regexNonWhitespace.search(inText):
        return regexWhitespace.sub('\n', inText)
    else:
        return ''


def extract(input_xml):
    """Process entire input XML document, firing on events"""
    # Start pulling; it continues automatically
    doc = pulldom.parse(input_xml)
    output = ''
    for event, node in doc:
        # elements to ignore: xml
        if event == pulldom.START_ELEMENT and node.localName in ignore:
            continue
        # copy comments intact
        elif event == pulldom.COMMENT:
            doc.expandNode(node)
            output += node.toxml()
        # empty inline elements: pb, milestone
        elif event == pulldom.START_ELEMENT and node.localName in inlineEmpty:
            output += node.toxml()
        # non-empty inline elements: note, hi, head, l, lg, div, p, ab, 
        elif event == pulldom.START_ELEMENT and node.localName in inlineContent:
            output += regexEmptyTag.sub('>', node.toxml())
        elif event == pulldom.END_ELEMENT and node.localName in inlineContent:
            output += '</' + node.localName + '>'
        elif event == pulldom.START_ELEMENT and node.localName in blockElement:
            output += '\n<' + node.localName + '>\n'
        elif event == pulldom.END_ELEMENT and node.localName in blockElement:
            output += '\n</' + node.localName + '>'
        elif event == pulldom.CHARACTERS:
            output += normalizeSpace(node.data)
        else:
            continue
    return output


def normalize(inputText):
    return RE_MARKUP.sub('', inputText)
#    return regexPageBreak('',inputText)


def processToken(inputText):
    return {"t": inputText + ' ', "n": normalize(inputText)}


def processWitness(inputWitness, id):
    return {'id': id, 'tokens': [processToken(token) for token in inputWitness]}


for name in glob.glob('c56_FlagcollationChunks/1818_fullFlat_*'):
    matchString = name.split("fullFlat_", 1)[1]
    # ebb: above gets C30.xml for example
    matchStr = matchString.split(".", 1)[0]
    # ebb: above strips off the file extension
    with open(name, 'rb') as f1818file, \
            open('c56_FlagcollationChunks/msColl_c56Flagged_' + matchString, 'rb') as fMSc56file, \
            open('sga_1818_FlagXMLOutput/collation_' + matchStr + '.xml', 'w') as outputFile:
        fMSc56_tokens = regexLeadingBlankLine.sub('', regexBlankLine.sub('\n', extract(fMSc56file))).split('\n')
        f1818_tokens = regexLeadingBlankLine.sub('', regexBlankLine.sub('\n', extract(f1818file))).split('\n')
    #    f1823_tokens = regexLeadingBlankLine.sub('', regexBlankLine.sub('\n', extract(f1823file))).split('\n')
    #    f1831_tokens = regexLeadingBlankLine.sub('', regexBlankLine.sub('\n', extract(f1831file))).split('\n')
        f1818_tokenlist = processWitness(f1818_tokens, 'f1818')
    #    f1823_tokenlist = processWitness(f1823_tokens, 'f1823')
        fMSc56_tokenlist = processWitness(fMSc56_tokens, 'fMSc56')
    #    f1831_tokenlist = processWitness(f1831_tokens, 'f1831')
        collation_input = {"witnesses": [fMSc56_tokenlist, f1818_tokenlist]}
        table = collate(collation_input, output='xml', segmentation=True)
        # table = collate(collation_input, segmentation=True, layout='vertical')
        print('<!-- ' + nowStr + ' -->' + table, file=outputFile)


