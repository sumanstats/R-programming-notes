## Snippet for testthat

```r
snippet tt
	context("${1}")
	
	# ${2} -----------
	test_that(
	"${2}",
	expect_${3}(${4},${5})
	)${0}
  ```
