  ESX = exports["es_extended"]:getSharedObject()
  
  ESX.RegisterServerCallback('HuidJobClothe:GetJob', function(source, cb, job)
    local xPlayer = ESX.GetPlayerFromId(source)
	local grade
	if xPlayer.job.name == job then
	
	grade = xPlayer.job.grade
	
	elseif xPlayer.job2.name == job then
	
	grade = xPlayer.job2.grade
	
	end
	
	
    MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE grade <= @name and job_name = @jobname ORDER BY grade ASC', {
    ['@name'] = grade,
    ['@jobname'] = job
    }, function(users)

      local users = users
	  local label = nil

      if users ~= nil then
        cl = users
      end

      cb(cl)
    end)
  end)