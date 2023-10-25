@AbapCatalog.sqlViewName: 'ZKK_001_V_1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true // Key alan olacak mı?
@AccessControl.authorizationCheck: #NOT_REQUIRED // Yetki kontrolü var mı
@EndUserText.label: 'Eğitim 1' //View'ın açıklaması
define view zkk_001_ddl_1 
as select from ekko
inner join ekpo on ekpo.ebeln = ekko.ebeln
inner join mara on mara.matnr = ekpo.matnr
left outer join makt on makt.matnr = mara.matnr
                    and makt.spras = $session.system_language
inner join lfa1 on lfa1.lifnr = ekko.lifnr 
{
    key ekpo.ebeln,
    key ekpo.ebelp,
    ekpo.matnr,
    makt.maktx,
    ekpo.werks,
    ekpo.meins,
    lfa1.lifnr,
    lfa1.name1,
    concat( lfa1.stras, lfa1.mcod3 ) as satici_adresi
}
