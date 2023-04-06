import pandas as pd
import xmltodict
from gzip import GzipFile
from transformers import GPT2Tokenizer

tokenizer = GPT2Tokenizer.from_pretrained("gpt2")


pairs_gl = []
pairs_de = []

# import tmx to array
def get_gl_pair(_, tree):
    lang_pair = {}
    for elem in tree['tuv']:
        language = elem['@xml:lang']
        text = elem['seg']
        lang_pair[language] = text

    pairs_gl.append(lang_pair)
    return True

xmltodict.parse(
    GzipFile('raw/en-gl.tmx.gz'),
    item_depth=3, item_callback=get_gl_pair,
)

# import tmx to array
def get_de_pair(_, tree):
    lang_pair = {}
    for elem in tree['tuv']:
        language = elem['@xml:lang']
        text = elem['seg']
        lang_pair[language] = text

    pairs_de.append(lang_pair)
    return True

xmltodict.parse(
    GzipFile('raw/de-en.tmx.gz'),
    item_depth=3, item_callback=get_de_pair,
)

pairs_gl = pd.DataFrame(pairs_gl).sample(frac=1)
pairs_de = pd.DataFrame(pairs_de).sample(frac=1)

tc_train=0
index = 0
while tc_train < 100000:
  if bool(pairs_gl.iloc[index]['gl']):
    tc_train += len(tokenizer(pairs_gl.iloc[index]['gl'])['input_ids'])
  index += 1
index_train = index
print('Train sentence count: ', index)
print('Train token count: ', tc_train)
train_gl = pairs_gl[:index]
pd.DataFrame(pd.DataFrame(train_gl)['gl']).to_csv('test/gl-en.gl', header=False, index=False)
pd.DataFrame(pd.DataFrame(train_gl)['en']).to_csv('test/gl-en.en', header=False, index=False)

tc_train = 0
index = 0
while tc_train < 100000:
  if bool(pairs_de.iloc[index]['de']):
    tc_train += len(tokenizer(pairs_de.iloc[index]['de'])['input_ids'])
  index += 1
index_train = index
print('Train sentence count: ', index)
print('Train token count: ', tc_train)
train_de = pairs_de[:index]
pd.DataFrame(pd.DataFrame(train_de)['de']).to_csv('test/de-en.de', header=False, index=False)
pd.DataFrame(pd.DataFrame(train_de)['en']).to_csv('test/de-en.en', header=False, index=False)