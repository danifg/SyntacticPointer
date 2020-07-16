# SyntacticPointer
This repository includes a more efficient implementation of the left-to-right dependency parser with pointer networks described in NAACL paper [Left-to-Right Dependency Parsing with Pointer Networks](https://arxiv.org/abs/1903.08445). This is based on the updated version of the framework by Ma et al. (2018) (https://github.com/XuezheMax/NeuroNLP2) that implements a faster batch decoding and includes a "parse" mode to test a saved model. Unlike the original implementation (https://github.com/danifg/Left2Right-Pointer-Parser), this optimized version does not avoid the generation of cycles during decoding, since the presence of them is negligible. We additionally include an option to remove cycles as a post-processing step in order to output a well-formed dependency tree.


### Requirements
This implementation requires Python 3.6, PyTorch >=1.0.0, Gensim >= 0.12.0. 

### Experiments
First, please go to the experiments folder:

       cd experiments/

Then, to train the parser, just include the paths for data and embeddings in the following script, and run:

    ./scripts/train.sh <model_name>

and, to test an already-trained model, just run:

    ./scripts/test.sh <model_name>

Please add the argument ``--remove_cycles`` to the test script if you want to output dependency trees without cycles.

### Performance

We report a fair comparison against the DeepBiaffine ([Deep Biaffine Attention for Neural Dependency Parsing](https://arxiv.org/abs/1611.01734)) and StackPointer ([Stack-Pointer Networks for Dependency Parsing](https://arxiv.org/abs/1805.01087)) parsers (both also implemented under the framework by Ma et al. (2018) (https://github.com/XuezheMax/NeuroNLP2)) on the Stanford Dependency conversion ([v3.3.0](https://nlp.stanford.edu/software/stanford-parser-full-2013-11-12.zip)) of the English Penn Treebank with POS tags predicted by [Stanford POS tagger](https://nlp.stanford.edu/software/stanford-postagger-full-2018-10-16.zip).

| Parser        |  UAS  |  LAS  | Speed (sents/s) |
| ------------- | :---: | :---: | :-------------: |
| DeepBiaffine  | 95.91 | 94.31 |     103.29      |
| StackPointer  | 95.90 | 94.26 |     84.42       |
| SyntacticPointer | 96.02 | 94.39 |     194.21      |

While less accurate than the original parser (https://github.com/danifg/Left2Right-Pointer-Parser) due to the lack of cycle detection during decoding, this alternative implementation outperforms the other two parsers in both accuracy and speed.

### Citation
    @inproceedings{fernandez-gonzalez-gomez-rodriguez-2019-left,
            title = "Left-to-Right Dependency Parsing with Pointer Networks",
	    author = "Fern{\'a}ndez-Gonz{\'a}lez, Daniel  and G{\'o}mez-Rodr{\'\i}guez, Carlos",
	    booktitle = "Proceedings of the 2019 Conference of the North {A}merican Chapter of the Association for Computational    Linguistics: Human Language Technologies, Volume 1 (Long and Short Papers)",
	    month = jun,
	    year = "2019",
	    address = "Minneapolis, Minnesota",
	    publisher = "Association for Computational Linguistics",
	    url = "https://www.aclweb.org/anthology/N19-1076",
	    doi = "10.18653/v1/N19-1076",
	    pages = "710--716"
	    }

### Acknowledgments

This work has received funding from the European Research Council (ERC), under the European Union's Horizon 2020 research and innovation programme (FASTPARSE, grant agreement No 714150), from MINECO (FFI2014-51978-C2-2-R, TIN2017-85160-C2-1-R) and from Xunta de Galicia (ED431B 2017/01).