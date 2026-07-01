import zipfile
import re

# We will modify the generated valid pptx to add glue points and see if PowerPoint opens it.
with zipfile.ZipFile('/workspace/test_cxn.pptx', 'r') as zin:
    xml = zin.read('ppt/slides/slide1.xml').decode('utf-8')

# The shapes have id="3" and id="4", the connector is id="5"
# Add <p:cNvCxnSpPr><a:stCxn id="3" idx="1"/><a:endCxn id="4" idx="3"/></p:cNvCxnSpPr>
xml = xml.replace('<p:cNvCxnSpPr/>', '<p:cNvCxnSpPr><a:stCxn id="3" idx="1"/><a:endCxn id="4" idx="3"/></p:cNvCxnSpPr>')

with zipfile.ZipFile('/workspace/test_cxn_glue.pptx', 'w') as zout:
    with zipfile.ZipFile('/workspace/test_cxn.pptx', 'r') as zin:
        for item in zin.infolist():
            if item.filename == 'ppt/slides/slide1.xml':
                zout.writestr(item, xml)
            else:
                zout.writestr(item, zin.read(item.filename))
