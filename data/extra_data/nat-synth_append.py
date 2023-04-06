import pandas as pd

ndeen_de_df = pd.read_csv('../natural_data/train/de-en.de', header=None)
ndeen_en_df = pd.read_csv('../natural_data/train/de-en.en', header=None)
nglen_gl_df = pd.read_csv('../natural_data/train/gl-en.gl', header=None)
nglen_en_df = pd.read_csv('../natural_data/train/gl-en.en', header=None)
sdeen_de_df = pd.read_csv('../synthetic_data/train/de-en.de', header=None)
sdeen_en_df = pd.read_csv('../synthetic_data/train/de-en.en', header=None)
sglen_gl_df = pd.read_csv('../synthetic_data/train/gl-en.gl', header=None)
sglen_en_df = pd.read_csv('../synthetic_data/train/gl-en.en', header=None)


deen_de_df = pd.concat([ndeen_de_df, sdeen_de_df], ignore_index=True)
deen_en_df = pd.concat([ndeen_en_df, sdeen_en_df], ignore_index=True)
glen_gl_df = pd.concat([nglen_gl_df, sglen_gl_df], ignore_index=True)
glen_en_df = pd.concat([nglen_en_df, sglen_en_df], ignore_index=True)

assert len(deen_de_df) == len(deen_en_df)
assert len(glen_gl_df) == len(glen_en_df)

#Write to appended training files

deen_de_df.to_csv('appended_train/de-en.de', index=False)
deen_en_df.to_csv('appended_train/de-en.en', index=False)
glen_gl_df.to_csv('appended_train/gl-en.gl', index=False)
glen_en_df.to_csv('appended_train/gl-en.en', index=False)

#Write to files for bpe

pd.concat([deen_de_df, deen_en_df]).to_csv('../../training_scripts/bpe/appended_data/de-en_concat.csv', index=False)
pd.concat([glen_gl_df, glen_gl_df]).to_csv('../../training_scripts/bpe/appended_data/gl-en_concat.csv', index=False)