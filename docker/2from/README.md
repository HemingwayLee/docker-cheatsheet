# What
* 2 `FROM` statements does not work as what we expected
  * whichever is the last `FROM` statement is the final base image
  * To copy artifacts and outputs from intermediate images use `COPY --from=<base_image_number>`

