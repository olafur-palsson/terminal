select *
from Log
where Logger != 'Microsoft.AspNetCore.Server.Kestrel'
  -- frontend
  and Logger != 'angular'
  and Logger != 'Microsoft.Hosting.Lifetime'
  -- exceptions
  and Logger != 'Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware'
  and Logger != 'Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware'

  -- hosting
  and Logger != 'CubeShop.Program'
  and Logger != 'Microsoft.AspNetCore.Server.IIS.Core.IISHttpServer'
  and Logger != 'Microsoft.AspNetCore.Server.Kestrel.Core.KestrelServer'
  and Logger != 'Microsoft.Extensions.Hosting.Internal.Host'
  and Logger != 'Microsoft.AspNetCore.Mvc.ViewFeatures.ViewResultExecutor'
  and Logger != 'Microsoft.AspNetCore.DataProtection.KeyManagement.XmlKeyManager'
  and Logger != 'System.Net.Http.HttpClient.Default.LogicalHandler'
  and Logger != 'System.Net.Http.HttpClient.Default.ClientHandler'
  and Logger != 'Microsoft.AspNetCore.Hosting.Diagnostics'
  and Logger != 'Microsoft.AspNetCore.HttpsPolicy.HttpsRedirectionMiddleware'
  and Logger != 'Microsoft.AspNetCore.Watch.BrowserRefresh.BrowserRefreshMiddleware'
  and Logger != 'Microsoft.WebTools.BrowserLink.Net.BrowserLinkMiddleware'

  -- payments
  and Logger != 'CubeShop.Controllers.PaymentController'
  and Logger != 'CubeShop.Controllers.ValitorPaymentSuccessController'
  and Logger != 'CubeShop.Controllers.TestPaymentSuccessController'

  -- orders
  and Logger != 'CubeShop.Services.XalServices'
    
  -- sync
  and Logger != 'CubeShop.Controllers.DkSyncController'
  and Logger != 'CubeShop.Controllers.WebJobController'
  and Logger != 'CubeShop.Controllers.UcSyncController'
  and Logger != 'CubeShop.Controllers.SyncController'

  -- data warehouse
  and Logger != 'DwApi.Program'
  and Logger != 'DwApi.Controllers.CustomerController'
  and Logger != 'DwApi.Controllers.ItemController'
  and Logger != 'DwApi.Controllers.VendorItemController'
  and Logger != 'DwApi.Controllers.ItemInventoryController'
  and Logger != 'DwApi.Controllers.CarDirectoryController'
  and Logger != 'DwApi.Controllers.TecDocVendorController'
  and Logger != 'DwApi.Controllers.OpusOrderController'
  and Logger != 'DwApi.Controllers.ImageController'
  and Logger != 'DwApi.Services.OpusServices'

  -- other
  and Logger != 'CubeShop.Services.Dal'
  and Logger != 'CubeShop.Controllers.BlobStorageController'
  and Logger != 'CubeShop.Startup.RequestResponseInterceptingMiddleware'
  and Logger != 'CubeShop.Controllers.IslandController'
  and Logger != 'CubeShop.Controllers.AnonymousLoginController'
  and Logger != 'CubeShop.Controllers.LoginController'
  and Logger != 'CubeShop.Controllers.ItemController'

order by Logged desc
