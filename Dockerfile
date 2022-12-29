FROM phusion/passenger-ruby30

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . ./

#CMD [ "bundle", "exec", "rackup", "--port", "80", "--host", "0.0.0.0" ]
CMD ["bundle", \
    "exec", \
    "passenger", \
    "start", \
    "--port=80", \
    "--max-pool-size=10", \
    "--min-instances=1" \
]