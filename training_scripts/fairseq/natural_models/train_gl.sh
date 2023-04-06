LAYERS=3
HEADS=4
FF=1024
EMBED=512
BATCH=2000
INTERVAL=4

SRC=gl
TRG=en
SET=$1

DATE=$(date +%Y-%m-%d-%H-%M-%S)
echo $DATE

SAVEDIR=train_gl

DATADIR=preproced_gl
export CUDA_VISIBLE_DEVICES='0'
fairseq-train $DATADIR \
  --source-lang $SRC \
  --target-lang $TRG \
  --save-dir $SAVEDIR \
  --seed 314159 \
  --arch transformer \
  --share-all-embeddings \
  --encoder-layers $LAYERS \
  --decoder-layers $LAYERS \
  --encoder-embed-dim $EMBED \
  --decoder-embed-dim $EMBED \
  --encoder-ffn-embed-dim $FF \
  --decoder-ffn-embed-dim $FF \
  --encoder-attention-heads $HEADS \
  --decoder-attention-heads $HEADS \
  --dropout 0.5 \
  --attention-dropout 0.3 \
  --relu-dropout 0.0 \
  --weight-decay 0.0 \
  --criterion label_smoothed_cross_entropy --label-smoothing 0.2 \
  --optimizer adam --adam-betas '(0.9, 0.98)' \
  --clip-norm 0.0 \
  --lr-scheduler inverse_sqrt \
  --warmup-updates 4000 \
  --warmup-init-lr 1e-7 --lr 0.0005 \
  --max-tokens $BATCH \
  --update-freq $INTERVAL \
  --max-epoch 100 \
  --ddp-backend=no_c10d \
  --save-interval-updates 1000 --keep-interval-updates 20 \
  --log-format json --log-interval 20



