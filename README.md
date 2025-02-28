
# Setup a CI/CD pipeline in github

There are quite many ways to setup a CI/CD pipeline by combining different tech stacks. 

Here we just utilize github to provide a ( __python + docker__ ) solution and demonstate how to setup a blueprint-based CI/CD pipeline.

This solution covers these key concepts: "Blueprint-driven", "Modularity", "Standardization", and "Extensibility"


## Components:
* __Blueprint Config__ (blueprint.yaml): specify the project details, one can switch the pipeline to different tech stack, stage,  deploy target and other settings from here.
* __Shared workflows__ for pipeline stages: reusable YAML files (test.yml, lint.yml, build.yml, deploy.yml, etc.)
* __Main workflow__ (ci-cd.yml): reads blueprint and orchestrates the pipeline automatically
* __Helper Script__: to parsing the blueprint and set the variables
* __Branching and tagging rules__: enforce via github actions and semantic versioning.

## Workflow
* __Parsing blueprint__: to determine tech stack, build type, deployment method, branching, stages, and etc. 
* __Compose pipeline__: dynamically trigger reusable workflows based on the blueprint
* __Execute pipeline__: run tasks: lint, test, build, deploy, and etc.

## Directory structure
```
project (CICD)
|_ .github
|  |_ scripts
|  |  |_ parse-blueprint.sh
|  |_ workflows
|  |  |_ ci-cd.yml  # main workflow
|  |  |_ templates  # reusable workflow templates
|  |     |_ build-yml
|  |     |_ deploy-yml
|  |     |_ lint-yml
|  |     |_ test-yml
|  |_ src
|  |  |_ test_capitalize.py
|_ .gitignore
|_ blueprint.yaml
|_ README.md
```
**NOTE**
* __templates folder__:  NOTE: these have been moved into workflows folder in the implementation, as issues in github
* __src__: Saving app source codes, and test assets

