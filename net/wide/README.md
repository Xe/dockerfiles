USAGE
=====

```
docker build -t xena/wide . &&\
docker run \
	-e VIRTUAL_HOST=wide.hyperadmin.yochat.biz \
	-v /data/sdb/wide/data:/wide/data \
	-v /data/sdb/wide/users:/wide/app/conf/users \
	xena/wide
```

Then navigate to http://wide.hyperadmin.yochat.biz.

This may not work reliably outside of hyperadmin range.
