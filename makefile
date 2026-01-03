check:
	mix format \
	&& mix excellent_migrations.check_safety \
	&& mix recode \
	&& mix coveralls.html \
	&& mix credo --strict
