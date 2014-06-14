# about iRosi gem

r  o  s  i 大家懂的，这是一个简单的下载图片的gem而已

## Installation

Add this line to your application's Gemfile:

    gem 'irosi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install irosi

```
➜  test  gem install irosi
Fetching: irosi-0.0.1.gem (100%)
Successfully installed irosi-0.0.1
Parsing documentation for irosi-0.0.1
Installing ri documentation for irosi-0.0.1
Done installing documentation for irosi after 0 seconds
1 gem installed
```


##  功能

- 根据指定的专辑编号下载
- 下载区间编号之内的所有专辑


## 查看帮助文档

```
➜  irosi git:(master) ✗ irosi --help    
here is help messages of rosi command line tool.
    -n, --alburmnum Name             download one alburnm with num
    -b, --begin begin                the first alburnm num for download
    -e, --end end                    the last alburnm num for download
    -f, --file file                  download one alburnm with num

```

## 使用方法

```
➜  test  irosi -n 100 

{:file=>"/home/i5ting/rosi/test", :num=>"100"}
exist path
download alburm number = 100
download_all starting...

Downloading 
.........

```

## Api说明


```
Rosi.download do
   for num in 1..8
      tem(num)
   end
end
```

or 

```
Rosi.download do
  item(1)
  item(2)
  item(4)
end

```

目前还比较简陋，欢迎反馈


## Contributing

1. Fork it ( http://github.com/<my-github-username>/irosi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

