import pandas as pd

dir = '../../../data/appended_data/'
pd.concat([pd.read_csv(dir+'de-en.de'), pd.read_csv(dir+'de-en.en')]).to_csv('de-en_concat.csv', index=False)

dir = '../../../data/appended_data/'
pd.concat([pd.read_csv(dir+'gl-en.gl'), pd.read_csv(dir+'gl-en.en')]).to_csv('gl-en_concat.csv', index=False)