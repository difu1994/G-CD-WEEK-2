###Read HDF5 files

#creates a h5 file
h5createFile("example.h5")

#create groups within the file
#similar to like folders in a main folder
h5createGroup("example.h5", "foo")
h5createGroup("example.h5", "baa")

#create subgroup in group "foo" within the file
#similar to subfolders in folder in a main folder
h5createGroup("example.h5", "foo/foobaa")
example <- h5ls("example.h5")

#write into groups created
A <- matrix(1:10, 5, 2)
#write matrix A into group "foo"
h5write(A, "example.h5", "foo/A") 

B <- array(seq(0.1, 2.0, by = 0.1), dim = c(5, 2, 2))
#assign scale attribute of array B to be "liter"
attr(B, "scale") <- "liter"
#write array B into group "foo/foobaa"
h5write(B, "example.h5", "foo/foobaa/B")
example2 <- h5ls("example.h5")

#write directly into main folder
df <- data.frame(1L:5L, seq(0, 1, length.out = 5), c("ab", "cde", "fghi", "a", "s"),
                 stringsAsFactors = FALSE)
h5write(df, "example.h5", "df")
example3 <- h5ls("example.h5")


#read HDF5 data
readA <- h5read("example.h5", "foo/A")
readB <- h5read("example.h5", "foo/foobaa/B")
readdf <- h5read("example.h5", "df")



















