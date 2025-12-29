# Homebrew tap for `sop`

`sop` is a swiss-army knife for processing RDF and Linked Data on the command line.

Project home: <https://github.com/pchampin/sophia-cli>

## Installation

Install directly from the tap:

``` bash
brew install ktk/sop/sop
```

Or first add the tap, then install:

``` bash
brew tap ktk/sop
brew install sop
```

Use it in a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle)
`Brewfile`:

``` ruby
tap "ktk/sop"
brew "sop"
```

## Updating

Update Homebrew and the tap, then upgrade:

``` bash
brew update
brew upgrade sop
```

If you need to pull from `main` explicitly:

``` bash
cd "$(brew --repository ktk/sop)"
git pull origin main
brew reinstall sop
```

## Usage

After installation:

``` bash
sop --help
sop --version
```

See the upstream documentation and examples in the sophia-cli
repository.

## Homebrew documentation

`brew help`, `man brew` or <https://docs.brew.sh>.
