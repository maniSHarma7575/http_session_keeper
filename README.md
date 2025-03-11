# HttpSessionKeeper

`HttpSessionKeeper` is a lightweight Ruby gem that provides a simple HTTP server with session management, cookies, and Redis-based session storage. It is designed to be easy to use and extend, making it a great tool for building small web applications or prototyping.

---

## Features

- **Session Management**: Similar to Rails sessions, but lightweight and customizable.
- **Cookie Support**: Easily manage cookies in requests and responses.
- **Redis Storage**: Store session data in Redis for persistence and scalability.
- **Simple API**: Easy-to-use API for handling requests, responses, sessions, and cookies.

---

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'http_session_keeper'
```

Then execute:

```bash
bundle install
```

Or install it directly using:

```bash
gem install http_session_keeper
```

---

## Usage

### Starting the Server

To start the HTTP server, run the following command:

```bash
http_session_keeper
```

By default, the server runs on `http://localhost:3000`. You can specify a custom port and Redis URL:

```bash
http_session_keeper --port 4000 --redis-url redis://localhost:6379
```

---

## Configuration

### Redis

By default, `HttpSessionKeeper` connects to Redis at `redis://localhost:6379`. You can specify a custom Redis URL when starting the server:

```bash
http_session_keeper --redis-url redis://your-redis-url:6379
```