module StatisticsHelper

  def input_over_time
    line_chart Mood.group_by_month(:created_at, range: 2.years.ago..Time.now, default_value: "missing").count,  width: "500px", height: '300px', library: {
      title: {text: 'Activity over time', x: -20},
      yAxis: {
         allowDecimals: false
      }
    }
  end

  def mood_pie_chart
    pie_chart Mood.group(:mood).count, width: "500px", height: '300px'
  end

  def mood_time_graph
    line_chart Mood.group_by_month(:created_at, range: 2.years.ago..Time.now, default_value: "missing").average(:mood),
    width: "500px", height: '300px', allowDecimals: false
  end

  def mood_sleep_graph
    scatter_chart Mood.pluck(:sleep, :mood), width: "500px", height: '300px'
  end

  def mood_exercise_graph
    scatter_chart Mood.pluck(:exercise, :mood), width: "500px", height: '300px'
  end

  def mood_location_graph
    bar_chart Mood.group(:city).average(:mood), width: "500px", height: '100px'
  end

end
