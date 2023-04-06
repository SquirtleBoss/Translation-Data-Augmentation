subword-nmt learn-bpe -s 16000 < de-en_concat.csv > de-en.codes
subword-nmt learn-bpe -s 16000 < gl-en_concat.csv > gl-en.codes

subword-nmt apply-bpe -c de-en.codes < ../../../data/appended_data/de-en.de > bpe_data/de-en.de
subword-nmt apply-bpe -c de-en.codes < ../../../data/appended_data/de-en.en > bpe_data/de-en.en
subword-nmt apply-bpe -c gl-en.codes < ../../../data/appended_data/gl-en.gl > bpe_data/gl-en.gl
subword-nmt apply-bpe -c gl-en.codes < ../../../data/appended_data/gl-en.en > bpe_data/gl-en.en

subword-nmt apply-bpe -c de-en.codes < ../../../data/natural_data/val/de-en.de > bpe_data/de-en_val.de
subword-nmt apply-bpe -c de-en.codes < ../../../data/natural_data/val/de-en.en > bpe_data/de-en_val.en
subword-nmt apply-bpe -c gl-en.codes < ../../../data/natural_data/val/gl-en.gl > bpe_data/gl-en_val.gl
subword-nmt apply-bpe -c gl-en.codes < ../../../data/natural_data/val/gl-en.en > bpe_data/gl-en_val.en

subword-nmt apply-bpe -c de-en.codes < ../../../data/test_data/de-en.de > bpe_data/de-en_test.de
subword-nmt apply-bpe -c de-en.codes < ../../../data/test_data/de-en.en > bpe_data/de-en_test.en
subword-nmt apply-bpe -c gl-en.codes < ../../../data/test_data/gl-en.gl > bpe_data/gl-en_test.gl
subword-nmt apply-bpe -c gl-en.codes < ../../../data/test_data/gl-en.en > bpe_data/gl-en_test.en