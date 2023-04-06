fairseq-interactive --path train_de/checkpoint_best.pt \
			--beam 5 \
			--source-lang de --target-lang en \
			preproced_de < ../../bpe/augmented_data/bpe_data/de-en_test.de | grep "^H-" | cut -f3 | sed -r 's/(@@ )|(@@ ?$)//g' > de-en.trg
            
fairseq-interactive --path train_gl/checkpoint_best.pt \
			--beam 5 \
			--source-lang gl --target-lang en \
			preproced_gl < ../../bpe/augmented_data/bpe_data/gl-en_test.gl | grep "^H-" | cut -f3 | sed -r 's/(@@ )|(@@ ?$)//g' > gl-en.trg