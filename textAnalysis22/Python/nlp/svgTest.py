from collections import Counter
import pygal
import spacy
# Need line 10 the first time: Then comment it out after the first time you run it:
# nlp = spacy.cli.download("en_core_web_sm")
nlp = spacy.load('en_core_web_sm')
lemmatizer = nlp.get_pipe("lemmatizer")


starWords = open('ANHroughDraft-stagedirs.txt', 'r', encoding='utf8')

words = starWords.read()
starWords = nlp(words)



def adjcollector(words):
    Adj = []
    count = 0
    for token in words:
        if token.pos_ == "ADJ":
            count += 1

            Adj.append(token.lemma_)
            print(count, ": ", token, token.pos_, spacy.explain(token.pos_))

    return Adj

listAdj = adjcollector(starWords)
adj_freq = Counter(listAdj)

sortedAdj = adj_freq.most_common()
topFifteen = adj_freq.most_common(15)
print(topFifteen)



bar_chartOverTen = pygal.Bar()
bar_chartTopFifteen = pygal.Bar()

bar_chartOverTen.title = 'Adjectives Repeated More than Ten Times in A New Hopes Rough Draft'
bar_chartTopFifteen.title = 'The Top Ten Adjectives Used in A New Hopes Rough Draft'


for s in sortedAdj:
    if s[1] > 15:
        bar_chartOverTen.add(s[0], s[1])

for t in topFifteen:
    # this is a list of tuples with word and number, so we return its values like this:
    print(t[0], t[1])
    bar_chartTopFifteen.add(t[0], t[1])

# outputting the SVG as a file: https://www.pygal.org/en/stable/documentation/output.html
print(bar_chartOverTen.render(is_unicode=True))
bar_chartOverTen.render_to_file('bar_chartOver5.svg')
bar_chartTopFifteen.render_to_file('bar_chartTopTen.svg')
