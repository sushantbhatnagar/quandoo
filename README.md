# Secure Area Website

This website can be used by users to login to secure area, check their details by hovering over different avatars and validate details of their emails, website and actions available in respective data tables.

# Framework Details

To run this framework and its feature scenarios, you will need to have few gems installed beforehand:

```
gem install cucumber
gem install watir
gem install page-object
gem install data_magic
gem install fig_newton
```

```gem page-object``` makes it easier to define page objects and easier to make changes as your site changes. This helps us implementing the page object design pattern with ease.

```gem data_magic``` tells where to find the files that contain the default data. The **config/data** directory is the default directory used by data_magic.

```gem fig_newton``` was designed to make it easier to manage different test environments. It is also common to have to change some of the values we use in our tests as we move from environment to environment. The **config/environments** directory is the default directory used by fig_newton.

# Framework Folder Structure

Cucumber is a tool that facilitates Behavior Driven Development framework. It acts as a living documentation wherein the scenarios can be written in Gherkin language, a plain text language which keeps Stakeholders, Developers and Testers on the same page in terms of the feature to be developed. 

It focus on end user and the scenarios that are priority as per the business domain. The tests are easy to write, maintainable and reusable.

Cucumber execution starts from **support/env.rb** file loading the required gems and adding PageObject to the World object that Cucumber creates.

Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle. We can put them in any other file under the support directory, for example in a file called **support/hooks.rb**.

Feature files can be put under **features/** directory with .feature extension.

Actual code implementation takes place in **step_definitions/** directory having steps to navigate through the scenarios defined in the feature files.

**lib/pages** directory contains the page object desing pattern implementation with each page in the application defined as a separate page.

**lib/panels** directory contains the reusable elements that can be used across different pages supporting page-object design pattern.

Different environments like regression, smoke tests can be defined in **cucumber.yml** file as profiles. 

# Run Scenarios - Instructions

To run the scenarios included in the feature files, there are two steps

```
cd secure_area\
```

To run all features at once:
```
cucumber -p secure_area features
```

To run scenarios using tags:
```
cucumber -p secure_area -t @scenario_tag
```

**Note:** Please note '@scenario_tag' is the tag defined on each scenario in the feature file

# Reports

**features.report.html** file contains test execution details and the status of the scenarios resulting in pass or fail, using Cucumber default reporting format. 
 
# Technology Stack
 
 - Tool Used:             Cucumber
 - Language:              Ruby
 - Version Control:       GIT
 - Patterns:              Page-Object, PageFactory, Process, Assertion Patterns
 