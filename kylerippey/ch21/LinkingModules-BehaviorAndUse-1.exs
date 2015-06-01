# Question:
# Why does the first call to puts have to unquote the values in its
# interpolation but the second call does not?

# Answer:
# Because name and args were passed into the defmacro function, while
# result is a local variable referencing the unquoted value of content.