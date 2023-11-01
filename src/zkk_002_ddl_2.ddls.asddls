@AbapCatalog.sqlViewName: 'ZKK_002_CDS_2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'İkinci Hafta Ödev 2'
define view ZKK_002_DDL_2 as select from ZKK_002_DDL_1 
{
  key vbeln,
    sum(conversion_netwr) as Toplam_Net_Deger,
    kunnrAd,
    count(*) as toplamFatura,
   division(cast( sum(conversion_netwr) as abap.curr( 10, 3 ) ), cast( count(*) as abap.int1 ), 3) as ortalama_miktar,
    substring(fkdat,1,4) as Faturalama_Yili,
    substring(fkdat,4,2) as Faturalama_Ayi,
    substring(fkdat,6,2) as Faturalama_Gunu,
    substring(inco2_l,1,3) as incoterm_yeri   
}
group by vbeln,
         kunnrAd,
         fkdat,
         inco2_l
