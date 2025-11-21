local M = {}
local urlPrefix = "https://raw.githubusercontent.com/espocrm/espocrm/refs/heads/master/schema/"

-- Forward declarations
local getListOfResouceFiles
local getListOfMetadataFiles
local getListOfLayoutFiles
local getListOfAppFiles

local function getSchemaEntry(description, fileMatch, filePath)
  return {
    description = 'EspoCRM ' .. description .. ' Schema',
    fileMatch = {
      '**/Resources/' .. fileMatch,
    },
    name = filePath,
    url = urlPrefix .. filePath
  }
end

function M.getEspoSchema()
  local schemas = {}

  for _, fileName in ipairs(getListOfResouceFiles()) do
    table.insert(schemas, getSchemaEntry(fileName, fileName, fileName))
  end

  for _, fileName in ipairs(getListOfMetadataFiles()) do
    local fileNameWithoutExt = fileName:gsub('%.json$', '')
    table.insert(schemas, getSchemaEntry(
      fileNameWithoutExt,
      'metadata/' .. fileNameWithoutExt .. '/*.json',
      'metadata/' .. fileName
    ))
  end

  for _, fileName in ipairs(getListOfLayoutFiles()) do
    local fileNameWithoutExt = fileName:gsub('%.json$', '')
    table.insert(schemas, getSchemaEntry(
      fileNameWithoutExt,
      'layouts/*/' .. fileName,
      'layouts/' .. fileName
    ))
  end

  for _, fileName in ipairs(getListOfAppFiles()) do
    local fileNameWithoutExt = fileName:gsub('%.json$', '')
    table.insert(schemas, getSchemaEntry(
      fileNameWithoutExt,
      'metadata/app/' .. fileName,
      'metadata/app/' .. fileName
    ))
  end

  return schemas
end

function getListOfResouceFiles()
  return {
    'autoload.json',
    'module.json',
    'routes.json',
  }
end

function getListOfMetadataFiles()
  return {
    "aclDefs.json",
    "authenticationMethods.json",
    "clientDefs.json",
    "dashlets.json",
    "entityAcl.json",
    "entityDefs.json",
    "fields.json",
    "integrations.json",
    "logicDefs.json",
    "notificationDefs.json",
    "pdfDefs.json",
    "recordDefs.json",
    "scopes.json",
    "selectDefs.json",
    "streamDefs.json",
  }
end

function getListOfLayoutFiles()
  return {
    "details.json",
    "list.json",
  }
end

function getListOfAppFiles()
  return {
    "acl.json",
    "aclPortal.json",
    "actions.json",
    "addressFormats.json",
    "adminPanel.json",
    "api.json",
    "appParams.json",
    "authentication.json",
    "authentication2FAMethods.json",
    "cleanup.json",
    "client.json",
    "clientIcons.json",
    "clientNavbar.json",
    "clientRecord.json",
    "clientRoutes.json",
    "complexExpression.json",
    "config.json",
    "consoleCommands.json",
    "containerServices.json",
    "currency.json",
    "currencyConversion.json",
    "databasePlatforms.json",
    "dateTime.json",
    "defaultDashboardLayouts.json",
    "defaultDashboardOptions.json",
    "emailTemplate.json",
    "entityManager.json",
    "entityManagerParams.json",
    "entityTemplateList.json",
    "entityTemplates.json",
    "export.json",
    "fieldProcessing.json",
    "file.json",
    "fileStorage.json",
    "formula.json",
    "hook.json",
    "image.json",
    "jsLibs.json",
    "language.json",
    "layouts.json",
    "linkManager.json",
    "mapProviders.json",
    "massActions.json",
    "metadata.json",
    "orm.json",
    "pdfEngines.json",
    "portalContainerServices.json",
    "reactions.json",
    "rebuild.json",
    "record.json",
    "recordId.json",
    "regExpPatterns.json",
    "relationships.json",
    "scheduledJobs.json",
    "select.json",
    "smsProviders.json",
    "templateHelpers.json",
    "templates.json",
    "webSocket.json",
  }
end

return M
