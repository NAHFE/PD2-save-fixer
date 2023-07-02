local orig_clbk_result_load_vr_beta_progress = SavefileManager.clbk_result_load_vr_beta_progress
local orig_clbk_result_load = SavefileManager.clbk_result_load
local orig_clbk_result_load_backup = SavefileManager.clbk_result_load_backup

function SavefileManager:clbk_result_load_vr_beta_progress(task_data, result_data)
	if type_name(result_data) == "table" then
		for slot, slot_data in pairs(result_data) do
			if slot == SavefileManager.VR_BETA_PROGRESS_SLOT and slot_data.status == "OK" then
				slot_data.data.user_id = self._USER_ID_OVERRRIDE or Steam:userid()
			end
		end
	end

	orig_clbk_result_load_vr_beta_progress(self, task_data, result_data)
end


function SavefileManager:clbk_result_load(task_data, result_data)
	if type_name(result_data) == "table" then
		for slot, slot_data in pairs(result_data) do
			if slot_data.status == "OK" then
				slot_data.data.user_id = self._USER_ID_OVERRRIDE or Steam:userid()
			end
		end
	end
	
	orig_clbk_result_load(self, task_data, result_data)
end

function SavefileManager:clbk_result_load_backup(task_data, result_data)
	if type_name(result_data) == "table" then
		for slot, slot_data in pairs(result_data) do
			if slot == self.BACKUP_SLOT and slot_data.status == "OK" then
				slot_data.data.user_id = self._USER_ID_OVERRRIDE or Steam:userid()
			end
		end
	end

	orig_clbk_result_load_backup(self, task_data, result_data)
end
