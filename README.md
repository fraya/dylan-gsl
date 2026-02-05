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

