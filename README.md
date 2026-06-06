# dylan-gsl
GNU Scientific Library bindings for Open Dylan

## Installation

### Install GSL libraries

For instance in Debian/Ubuntu you can install the GSL libraries with:

```
sudo apt-get install libgsl-dev libgslcblas0
```

### Add dylan-gsl to your project

In your `dylan-package.json` add:

```
{
  "dependencies": {
    "dylan-gsl"
  }
}
```

And run `deft update`

# Modules

The current supported modules are:

- [X] Complex numbers
- [X] Math constants
- [X] Random distributions
- [X] Random number generation
- [X] Running statistics
- [X] Statistics
- [X] Vectors

See the [src/lib/README.md](src/lib/README.md) file for more details.