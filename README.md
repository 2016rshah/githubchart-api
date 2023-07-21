# [Github Chart API](https://ghchart.rshah.org)

Make this:

![2016rshah's Github chart](https://ghchart.rshah.org/2016rshah)

with this:

    <img src="https://ghchart.rshah.org/2016rshah" alt="2016rshah's Github chart" />

Of course you can replace `2016rshah` with your own github username.

# Why

Being able to look back through the year and see how productive you've been is a great feeling, and that little green calendar is honestly one of my favorite data visualizations. But there's no reason it should be constrained to only living on the github website, you should be able to put it anywhere you want!

For example, I personally think it would really spiff up a [personal website](https://www.rshah.org/).

# Color Schemes

We also support custom color schemes! You can provide any base color and we will make shades for the chart. 

```
https://ghchart.rshah.org/<BASE-COLOR>/2016rshah 
```
Replace ```BASE-COLOR``` with a hex string eg: ```ff0000```

```
https://ghchart.rshah.org/<BASE-COLOR>/<BG-COLOR>/2016rshah
```
Replace ```BASE-COLOR``` & ```BG-COLOR``` with a hex string eg: ```ff0000```


<img src="https://ghchart.rshah.org/409ba5/2016rshah" alt="2016rshah's Github chart" />

<img src="https://ghchart.rshah.org/409ba5/222222/2016rshah" alt="2016rshah's Github chart" />




# Contributing

If you see anything that can be improved send in an issue/PR. 

To get the code up and running, make sure ruby, etc. is properly installed, then run `bundle install`, then run `ruby app.rb` and visit `localhost:4567` in your browser.

To deploy, make sure heroku cli is installed, login, add the heroku remote, and run `git push heroku master`.

# See also 
The [github repo](https://github.com/2016rshah/githubchart-api)

The [actual site](https://ghchart.rshah.org)

This [ruby gem](https://github.com/akerl/githubchart)

