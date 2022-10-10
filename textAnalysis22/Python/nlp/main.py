import spacy
# Need line 8 the first time: Then comment it out after the first time you run it:
# nlp = spacy.cli.download("en_core_web_sm")
nlp = spacy.load('en_core_web_sm')

starSet = open('ANHroughDraft-stagedirs.txt', 'r')
starSet1 = open('ANHfinalDraft-stagedirs.txt', 'r')
words = starSet.read()
words1 = starSet1.read()
wordstrings = str(words)
wordstrings1 = str(words1)


starWords = nlp(wordstrings)
for entity in starWords.ents:
     # if not token.is_punct:
    print(entity.text, "->", entity.label_)
starWords1 = nlp(wordstrings1)
for entity in starWords1.ents:
    print(entity.text, "->", entity.label_)
#with open("ANHroughDraft-stagedirs.txt", "r") as f1:
    #print(f1.read())

#with open("ANHfinalDraft-stagedirs.txt", "r") as f2:
   # print(f2.read())


