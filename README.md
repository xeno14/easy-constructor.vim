# easy-constructor.vim

Insert initializers by selecting decleration of a constructor in visual-mode and
call `:EasyConstructor`


### Example

```cpp
class Hoge {
  public:
    Hoge(int a, int b, int c)  // select here with visual-mode

  private:
    int a_, b_, c_;
};
```

Call `:EasyConstructor` then this code should be

```cpp
class Hoge {
  public:
    Hoge(int a, int b, int c)
    : a_(a), b_(b), c_(c)

  private:
    int a_, b_, c_;
};
```
