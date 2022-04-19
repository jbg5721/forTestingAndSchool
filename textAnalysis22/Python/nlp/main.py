import spacy
# Need line 8 the first time: Then comment it out after the first time you run it:
# nlp = spacy.cli.download("en_core_web_sm")
nlp = spacy.load('en_core_web_sm')

starSet = open('starwarsSetting.txt', 'r')
words = starSet.read()
wordstrings = str(words)
print(wordstrings)

starWords = nlp(wordstrings)
for token in starWords:
     # if not token.is_punct:
    print(token.text, "--->", token.pos_)
