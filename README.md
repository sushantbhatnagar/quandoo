# Secure Area Website

This website can be used by users to login to secure area, check their details by hovering over different avatars and validate details of their emails, website and actions available in respective data tables

# Framework Installation Instructions

To run this framework and its feature scenarios, you will need to have few gems installed beforehand:

```
gem install cucumber
gem install watir
gem install page-object
gem install data_magic
gem install fig_newton
```

```gem page-object``` makes it easier to define page objects and easier to make changes as your site changes. This helps us implementing the page object design pattern with ease.

```gem data_magic``` tells where to find the files that contain the default data. The config/data directory is the default directory used by data_magic.

```gem fig_newton``` was designed to make it easier to manage different test environments. It is also common to have to change some of the values we use in our tests as we move from environment to environment. The config/environments directory is the default directory used by fig_newton.


To run the scenarios included in the feature files, there are two steps

```
cd secure_area\
cucumber -p secure_area -t @scenario_tag
```

**Note:** Please note '@scenario_tag' is the tag defined on each scenario in the feature file
 
 
