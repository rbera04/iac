# Default app/env if not passed
APPLICATION_NAME := $(patsubst APP=%,%,$(filter APP=%, $(MAKECMDGOALS)))
ENVIRONMENT := $(patsubst ENV=%,%,$(filter ENV=%, $(MAKECMDGOALS)))

APPLICATION_NAME := default_app
ENVIRONMENT := dev

# Remove known keys from args
ARGS := $(filter-out plan apply destroy init output APP=% ENV=%, $(MAKECMDGOALS))

# Detect if last arg is true/false → lock
LAST_ARG := $(lastword $(ARGS))

ifeq ($(LAST_ARG),true)
  LOCK := true
  ARGS_CLEAN := $(filter-out true, $(ARGS))
else ifeq ($(LAST_ARG),false)
  LOCK := false
  ARGS_CLEAN := $(filter-out false, $(ARGS))
else
  LOCK := true
  ARGS_CLEAN := $(ARGS)
endif

# Handle optional exclude flags (can be multiple)
EXCLUDE_FLAGS := $(filter -exclude=%, $(ARGS_CLEAN))
OTHER_ARGS := $(filter-out -exclude=%, $(ARGS_CLEAN))

# Final extra args
EXTRA_ARGS := $(OTHER_ARGS) $(EXCLUDE_FLAGS)

.PHONY: plan apply destroy init output

plan:
	tofu plan -var-file="./common/$(APPLICATION_NAME)_$(ENVIRONMENT).tfvars" -lock=$(LOCK) $(EXTRA_ARGS)

apply:
	tofu apply -var-file="./common/$(APPLICATION_NAME)_$(ENVIRONMENT).tfvars" -lock=$(LOCK) $(EXTRA_ARGS)

destroy:
	tofu destroy -var-file="./common/$(APPLICATION_NAME)_$(ENVIRONMENT).tfvars" -lock=$(LOCK) $(EXTRA_ARGS)

init:
	tofu init

output:
	tofu output

%:
	@:
