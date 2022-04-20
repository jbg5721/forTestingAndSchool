import spacy
# Need line 8 the first time: Then comment it out after the first time you run it:
# nlp = spacy.cli.download("en_core_web_sm")
nlp = spacy.load('en_core_web_sm')

#starSet = open('ANHroughDraft-stagedirs.txt', 'r')
#starSet1 = open('ANHfinalDraft-stagedirs.txt', 'r')
#words = starSet.read()
#words1 = starSet1.read()
#wordstrings = str(words)
#wordstrings1 = str(words1)
# print(wordstrings)

#starWords = nlp(wordstrings)
#starWords1 = nlp(wordstrings1)
# for token in starWords:
     # if not token.is_punct:
#print(wordstrings.similarity(wordstrings1))
with open("ANHroughDraft-stagedirs.txt", "r") as f1:
    print(f1.read())

with open("ANHfinalDraft-stagedirs.txt", "r") as f2:
    print(f2.read())

print(f1.similarity(f2))
