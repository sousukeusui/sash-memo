# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "draw_opening"
pin "suggest_contractor"
pin "jquery", to: "https://code.jquery.com/jquery-3.7.1.min.js"
pin "@nathanvda/cocoon"
pin "bootstrap" # @5.3.3
pin "@popperjs/core", to: "https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.8/umd/popper.min.js" # @2.11.8
