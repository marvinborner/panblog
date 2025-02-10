# Panblog

> extensible blog generator based on pandoc

Go to the [demo](https://marvinborner.github.io/panblog) or to my [own
blog](https://text.marvinborner.de).

## Usage

-   install `entr`, `pandoc` and its
    [mermaid-filter](https://github.com/raghur/mermaid-filter)
-   `./new` to create a new private/unfinished entry
-   `./gen` to generate all files
-   `./dev` to spin up a development server for all files
-   `./dev md-priv/file.md` to spin up a development server for a single
    file
-   visit `localhost:8080` for the public preview or `/priv/` for the
    work-in-progress
-   when you're done writing, move `md-priv/file.md` to `md`
    -   you may also want to add `&& rm -r pub/priv` to the "Generate
        files" section of the `gen.yml` workflow
