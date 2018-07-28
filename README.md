
# Secure Area Website

This website can be used by users to login to secure area, check their details by hovering over different avatars and validate details of their emails, website and actions available in their respective data tables!

# Framework - Folder Structure

Cucumber is a tool that facilitates Behavior Driven Development framework. It acts as a living documentation wherein the scenarios can be written in Gherkin language, a plain text language which keeps Stakeholders, Developers and Testers on the same page in terms of the feature to be developed. 

It focuses on end-user and the scenarios that are priority as per the business domain. The tests are easy to write, maintainable and reusable.

Cucumber execution starts from **support/env.rb** file loading the required gems and adding PageObject to the World object that Cucumber creates.

Cucumber provides a number of hooks which allow us to run blocks at various points in the Cucumber test cycle. We can put them in any other file under the support directory, in this case ; a file called **support/hooks.rb**.

Feature files can be put under **features/** directory with .feature extension.

Actual code implementation takes place in **step_definitions/** directory having steps to navigate through the scenarios defined in the feature files.

**lib/pages** directory contains the page object design pattern implementation with each page/component in application defined as a separate page.

**lib/panels** directory contains the reusable elements that can be used across different pages supporting template-method pattern.

Different environments like regression, preproduction or tests related to smoke, sanity can be defined in **cucumber.yml** file as profiles.

**Gemfile** contains all the gems that are used within the project and is mentioned with the syntax as ```gem 'gem_name'```

The **Gemfile.lock** file is where Bundler records the exact versions that were installed.


# Framework - Installation Instructions

**_Assuming_** Ruby version > 2.3 is installed in your system along with any IDE that supports Ruby.

To run this framework and its feature scenarios, you will need to have few gems installed beforehand:

```
gem install cucumber
gem install watir
gem install page-object
gem install data_magic
gem install fig_newton
```

```gem page-object``` makes it easier to define page objects and changes as your site changes. This helps us implementing the page object design pattern with ease.

```gem data_magic``` makes it easier to find files that contain the default data. The **config/data** directory is the default directory used by data_magic.

```gem fig_newton``` makes it easier to manage different test environments. It is also common to have to change some of the values we use in our tests as we move from environment to environment. The **config/environments** directory is the default directory used by fig_newton.

# Scenarios - Run Instructions

To run the scenarios included in the feature files, there are two steps

```
cd secure_area
```

To run all features at once:
```
cucumber -p secure_area features
```

OR

To run scenarios using tags:
```
cucumber -p secure_area -t @scenario_tag
```

**Notes:** 
1. Please note '@scenario_tag' is the tag defined on each scenario in the feature file.
2. '-p' stands for profiles and is used to define the particular environment in which tests are executed. Check **cucumber.yml** file for more details.
3. Implemented and verified with Chrome Browser at this moment. Will be updated for other browsers(Firefox, IE) in future updates. 

# Reports - HTML Format

**features.report.html** file contains test execution details and status of the scenarios resulting in pass or fail, using Cucumber default reporting format.

To view the report, right-click on **features.report.html** file, hover on 'Open in Browser' option and choose the browser of your choice.
 
**html_report** profile is created in cucumber.yml file to have the reports generated with each execution.

Just use ```-p html_report``` with your cucumber command.  
 
# Technology Stack
 
 - Tool Used        :   Cucumber with BDD framework
 - Language         :   Ruby
 - Web-driver       :   Watir
 - Version Control  :   GIT
 - Reporting        :   Cucumber Default Reporting    
  
# Parallel Execution

- Install ```gem parallel_tests```

- To run all features/scenarios in parallel, ```parallel_cucumber features```

- [Read Here!](https://github.com/grosser/parallel_tests) for more details on parallel_tests gem.

- To run with specific tag(s) command that can be used is ```parallel_cucumber features/ -o '-t  @regression -t ~@manual'```

- Run features with parallel profile using command:
```parallel_cucumber features/ -n 6 -o '-t %tags% -t not @manual ENVIRONMENT=%environment% -p parallel'```

- Rerun Failed scenarios using command:
```cucumber @cucumber_failures.log --format html --out test_results_rerun.html ENVIRONMENT=%environment%```

# Jenkins 


