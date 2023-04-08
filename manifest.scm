(use-modules (gnu packages gettext)
             (gnu packages ruby)
             (guix packages)
             (guix download)
             ((guix licenses) #:prefix license:)
             (guix build-system ruby))

(define-public ruby-jekyll-avatar
  (package
    (name "ruby-jekyll-avatar")
    (version "0.8.0")
    (source (origin
              (method url-fetch)
              (uri (rubygems-uri "jekyll-avatar" version))
              (sha256
               (base32
                "0jzxmfcljfvjz21wls2w5mr2m5qp0mq9c80j009s4m6yq9vn4wza"))))
    (build-system ruby-build-system)
    (arguments
     `(#:tests? #f)) ;TODO
    (propagated-inputs (list jekyll))
    (synopsis "A Jekyll plugin for rendering GitHub avatars")
    (description
     "This package provides a Jekyll plugin for rendering GitHub avatars")
    (home-page "https://github.com/jekyll/jekyll-avatar")
    (license license:expat)))

(packages->manifest (list ruby-pathutil
                          ruby-addressable
                          ruby-safe-yaml
                          ruby-liquid
                          ruby-kramdown
                          ruby-colorator
                          ruby-i18n
                          ruby-jekyll-sass-converter
                          ruby-sassc
                          ruby-jekyll-avatar
                          ruby
                          po4a))
