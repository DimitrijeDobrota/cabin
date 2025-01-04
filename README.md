# Cabin

This repository contains all of the code for [my website](https://dimitrijedobrota.com/).


## Description

Apart from CSS and JS, which provide a nice looking theme with the ability to
toggle between day and night modes, all of the content is written in Markdown.
For that I leverage the power of [Stamd](https://github.com/DimitrijeDobrota/stamd), which turns Markdown to HTML, using the
first few lines as configuration.

Contents of my blog is stored in /blog folder and is also automatically
generated and indexed.


## Dependencies

* CMake 3.25.2 or latter
* Compiler with C++20 support (tested: clang 16.0.5, gcc 13.2.0)
* [Stamd](https://github.com/DimitrijeDobrota/stamd)


## Usage

> Please reference cabin_deploy.sh for relevant usage example.


## License

This project is licensed under the MIT License -
see the [LICENSE](LICENSE.md) file for details
