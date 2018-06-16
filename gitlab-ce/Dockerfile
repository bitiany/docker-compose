FROM gitlab/gitlab-ce:latest

ENV GITLAB_ROOT_PASSWORD=${GITLAB_ROOT_PASSWORD:-}
ENV initial_shared_runners_registration_token=NDl1ZjNtenMxcWR6NXZnbw==

RUN set -x \
    && sed -i "s/environment ({'GITLAB_ROOT_PASSWORD' => initial_root_password }) if initial_root_password/environment ({'GITLAB_ROOT_PASSWORD' => initial_root_password, 'GITLAB_SHARED_RUNNERS_REGISTRATION_TOKEN' => node['gitlab']['gitlab-rails']['initial_shared_runners_registration_token'] })/g" /opt/gitlab/embedded/cookbooks/gitlab/recipes/database_migrations.rb \
    && exec /assets/wrapper