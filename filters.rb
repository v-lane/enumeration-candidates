# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  id_exists = nil
  
  @candidates.each do |candidate|
    id_exists = candidate if candidate[:id] == id
  end

  return id_exists
end
  
  def experienced?(candidate)
    candidate[:years_of_experience] >= 2
  end
  
  def qualified_candidates(candidates)
    qualified_candidates = []
    candidates.each do |candidate|
      qualified_candidates << candidate if qualified_candidate?(candidate) 
    end
    return qualified_candidates
  end
  
  # More methods will go below

  def minimum_github_points?(candidate)
    candidate[:github_points] >= 100
  end

  def knows_python_or_ruby?(candidate)
    candidate[:languages].include?("Python") || candidate[:languages].include?("Ruby")
  end

  def recent_application?(candidate)
    (Date.today - candidate[:date_applied]) <= 15
  end

  def age_over_17?(candidate)
    candidate[:age] >= 18
  end

  def qualified_candidate?(candidate)
    experienced?(candidate) && 
    minimum_github_points?(candidate) && 
    knows_python_or_ruby?(candidate) && 
    recent_application?(candidate) && 
    age_over_17?(candidate)
  end

  def ordered_by_qualifications(candidates)
    candidates.sort_by!{|candidate| 
      [
        -1 * candidate[:years_of_experience],
        -1 * candidate[:github_points]
      ]
    }
  end