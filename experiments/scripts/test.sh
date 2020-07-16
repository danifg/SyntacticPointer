#!/usr/bin/env bash
CUDA_VISIBLE_DEVICES=0 OMP_NUM_THREADS=4 python -u parsing.py --mode parse --config configs/parsing/l2r.json --num_epochs 600 --batch_size 256 \
 --opt adam --learning_rate 0.001 --lr_decay 0.999997 --beta1 0.9 --beta2 0.9 --eps 1e-4 --grad_clip 5.0 \
 --loss_type token --warmup_steps 40 --reset 20 --weight_decay 0.0 --unk_replace 0.5 --beam 10 \
 --word_embedding sskip --word_path "embs/sskip.en.gz" --char_embedding random \
 --punctuation '.' '``' "''" ':' ',' \
 --train "data/ptb-train.conllx" \
 --dev "data/ptb-dev.conllx" \
 --test "data/ptb-test.conllx" \
 --model_path "models/l2r"$1  # --remove_cycles
