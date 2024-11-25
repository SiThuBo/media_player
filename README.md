# Media Uploader Project

This project implements a multimedia uploader in Ruby on Rails with support for images, videos, and audio. It utilizes CarrierWave, MiniMagick, and streamio-ffmpeg for file processing and thumbnail generation.

## Prerequisites

Ensure your system meets the following requirements before setting up the project:

### General Requirements
* Ruby: Version 3.0+ (use a Ruby version manager like rbenv or rvm)
* Rails: Version 7.0+
* Database: PostgreSQL or SQLite (for development)

### Required Software
* Git: Version control system.
* FFmpeg: For video and audio processing.
* ImageMagick: For image processing via MiniMagick.
* LibTASN1: Required dependency for FFmpeg.

## Installation Steps

### 1. Clone the Repository
```
git clone https://github.com/SiThuBo/media_player.git
cd media_uploader
```

### 2. Install Ruby Gems
```
bundle install
```

### 3. Setup the Database
```
rails db:create db:migrate
```

### 4. Verify FFmpeg Installation
```
ffmpeg -version
ffprobe -version
```

### 5. Start the Rails Server
```
rails server
```

## Features

* Image Upload: Automatically resizes and creates thumbnails for uploaded images.
* Video Upload: Generates a thumbnail from videos at the 5-second mark.
* Audio Upload: Supports common audio formats like MP3 and WAV.
* Authentication: (if implemented) Secure login and user-specific uploads.

## Troubleshooting

FFmpeg Errors: If FFmpeg or FFProbe commands fail, ensure dependencies like libtasn1 and gnutls are properly installed.

ImageMagick Errors: Ensure ImageMagick is installed.

Permission Issues: Ensure the uploads directory has the correct permissions.

## Dependencies

* CarrierWave: File uploader gem for Rails.
* MiniMagick: Lightweight image processing library.
* streamio-ffmpeg: Wrapper for FFmpeg functionality in Ruby.

```
gem 'carrierwave'
gem 'mini_magick'
gem 'streamio-ffmpeg'
```
