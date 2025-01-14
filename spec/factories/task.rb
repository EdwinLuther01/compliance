FactoryBot.define do 
  factory :basic_task, class: Task do
    association :workflow, factory: :basic_workflow
    task_type { 'run_something_in_the_background' }
    max_retries { 3 }
  end

  factory :task_without_retries, class: Task do
    association :workflow, factory: :basic_workflow
    task_type { 'run_something_in_the_background' }
    max_retries { 0 }
  end
end