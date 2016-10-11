FROM jruby:9.1.5-onbuild

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
