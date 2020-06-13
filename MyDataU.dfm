object MyData: TMyData
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 896
  Width = 1054
  object ItemMastS: TMyDataSource
    DataSet = ItemMast
    Left = 256
    Top = 344
  end
  object DsgMastS: TMyDataSource
    DataSet = dsgmast
    Left = 16
    Top = 344
  end
  object DepMastS: TMyDataSource
    DataSet = DepMast
    Left = 16
    Top = 392
  end
  object tbfeeDetail: TMyTable
    TableName = 'fee_detail'
    OrderFields = 'AC_NO'
    MasterFields = 'MR_NO'
    DetailFields = 'MR_NO'
    MasterSource = tbfeeS
    Connection = myconn
    AfterPost = tbfeeDetailAfterPost
    AfterDelete = tbfeeDetailAfterPost
    Left = 320
    Top = 104
    object tbfeeDetailMR_NO: TStringField
      FieldName = 'MR_NO'
      Origin = 'fee_detail.MR_NO'
      Size = 14
    end
    object tbfeeDetailAC_NO: TFloatField
      FieldName = 'AC_NO'
      Origin = 'fee_detail.AC_NO'
    end
    object tbfeeDetailAC_AMT: TCurrencyField
      FieldName = 'AC_AMT'
      Origin = 'fee_detail.AC_AMT'
      OnValidate = tbfeeDetailAC_AMTValidate
    end
    object tbfeeDetailAC_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'AC_NAME'
      LookupDataSet = tbAcMaster
      LookupKeyFields = 'AC_NO'
      LookupResultField = 'AC_NAME'
      KeyFields = 'AC_NO'
      Lookup = True
    end
    object tbfeeDetailAC_AMTPAID: TFloatField
      FieldName = 'AC_AMTPAID'
      Origin = 'fee_detail.AC_AMTPAID'
    end
  end
  object tbfeeDetailS: TMyDataSource
    DataSet = tbfeeDetail
    Left = 256
    Top = 104
  end
  object tbfee: TMyTable
    TableName = 'fee'
    DataTypeMap = <
      item
        DBType = 203
        FieldType = ftByte
      end>
    Connection = myconn
    AfterOpen = tbfeeAfterEdit
    AfterInsert = tbfeeAfterInsert
    AfterEdit = tbfeeAfterEdit
    BeforePost = tbfeeBeforePost
    AfterPost = tbfeeAfterEdit
    BeforeCancel = tbfeeBeforeCancel
    AfterCancel = tbfeeAfterEdit
    BeforeDelete = tbfeeBeforeDelete
    AfterDelete = tbfeeAfterEdit
    OnCalcFields = tbfeeCalcFields
    IndexFieldNames = 'MR_NO'
    Left = 320
    Top = 56
    object tbfeeMR_NO: TStringField
      FieldName = 'MR_NO'
      Origin = 'fee.MR_NO'
      Size = 14
    end
    object tbfeeMR_DATE: TDateField
      FieldName = 'MR_DATE'
      Origin = 'fee.MR_DATE'
    end
    object tbfeeNOTERM: TFloatField
      FieldName = 'NOTERM'
      Origin = 'fee.NOTERM'
    end
    object tbfeeFEE_AMT: TCurrencyField
      FieldName = 'FEE_AMT'
      Origin = 'fee.FEE_AMT'
    end
    object tbfeeCASH: TBooleanField
      FieldName = 'CASH'
      Origin = 'fee.CASH'
    end
    object tbfeeCHQ_NO: TStringField
      FieldName = 'CHQ_NO'
      Origin = 'fee.CHQ_NO'
    end
    object tbfeeLATE_FEE: TCurrencyField
      FieldName = 'LATE_FEE'
      Origin = 'fee.LATE_FEE'
    end
    object tbfeeStudID: TFloatField
      FieldName = 'STUDID'
      Origin = 'fee.STUDID'
    end
    object tbfeestudname: TStringField
      FieldKind = fkLookup
      FieldName = 'studname'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'Name'
      KeyFields = 'STUDID'
      Lookup = True
    end
    object tbfeesec: TStringField
      FieldKind = fkLookup
      FieldName = 'SEC'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'SECTION'
      KeyFields = 'STUDID'
      Size = 2
      Lookup = True
    end
    object tbfeetot_terms: TIntegerField
      FieldKind = fkLookup
      FieldName = 'tot_terms'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'NOTERMS'
      KeyFields = 'STUDID'
      Lookup = True
    end
    object tbfeetot_amt: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'tot_amt'
      Calculated = True
    end
    object tbfeestd: TFloatField
      FieldKind = fkLookup
      FieldName = 'STD'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'CLCODE'
      KeyFields = 'STUDID'
      Lookup = True
    end
    object tbfeeclDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'CLDESC'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'stCLDESC'
      KeyFields = 'STUDID'
      Lookup = True
    end
    object tbfeeDRAWN_ON: TSmallintField
      FieldName = 'DRAWN_ON'
      Origin = 'fee.DRAWN_ON'
    end
    object tbfeeCHQ_AMT: TCurrencyField
      FieldName = 'CHQ_AMT'
      Origin = 'fee.CHQ_AMT'
    end
    object tbfeeBranch: TSmallintField
      FieldName = 'BRANCH'
      Origin = 'fee.BRANCH'
    end
    object tbfeebdesc: TStringField
      FieldKind = fkLookup
      FieldName = 'BDESC'
      LookupDataSet = tbBmast
      LookupKeyFields = 'BCODE'
      LookupResultField = 'DESCR'
      KeyFields = 'DRAWN_ON'
      Lookup = True
    end
    object tbfeebrdesc: TStringField
      FieldKind = fkLookup
      FieldName = 'BRDESC'
      LookupDataSet = tbBrmast
      LookupKeyFields = 'BCODE'
      LookupResultField = 'DESCR'
      KeyFields = 'BRANCH'
      Lookup = True
    end
    object tbfeeBillNo: TFloatField
      FieldName = 'BILLNO'
      Origin = 'fee.BILLNO'
    end
    object tbfeeTERM: TSmallintField
      FieldName = 'TERM'
      Origin = 'fee.TERM'
    end
    object tbfeeAdmNo: TStringField
      FieldKind = fkLookup
      FieldName = 'ADMNO'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'ADMNO'
      KeyFields = 'STUDID'
      Size = 10
      Lookup = True
    end
    object tbfeeAdmn: TStringField
      FieldKind = fkLookup
      FieldName = 'Admn'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'ADMNO'
      KeyFields = 'STUDID'
      Size = 0
      Lookup = True
    end
    object tbfeeFEE_PROF_CODE: TSmallintField
      FieldKind = fkLookup
      FieldName = 'FEE_PROF_CODE'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'FEE_PROF_CODE'
      KeyFields = 'STUDID'
      Lookup = True
    end
    object tbfeeadhoc: TWordField
      FieldName = 'adhoc'
    end
  end
  object tbfeeS: TMyDataSource
    DataSet = tbfee
    Left = 256
    Top = 56
  end
  object tbfeeMatrix: TMyTable
    TableName = 'fee_matrix'
    Connection = myconn
    Left = 320
    Top = 152
    object tbfeeMatrixAC_NO: TFloatField
      FieldName = 'AC_NO'
      Origin = 'fee_matrix.AC_NO'
      Required = True
    end
    object tbfeeMatrixFEE: TCurrencyField
      FieldName = 'FEE'
      Origin = 'fee_matrix.FEE'
      Required = True
    end
    object tbfeeMatrixCODE: TSmallintField
      FieldName = 'FEE_PROF_CODE'
    end
  end
  object tbfeeMatrixS: TMyDataSource
    DataSet = tbfeeMatrix
    Left = 256
    Top = 152
  end
  object qryachead: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'select ac_master.ac_name, sum( fee_detail.ac_amtpaid ) sum_amt'
      'from ac_master'
      '   inner join fee_detail'
      '   on  (fee_detail.ac_no = ac_master.ac_no)  '
      '   inner join fee'
      '   on  (fee.mr_no = fee_detail.mr_no)  '
      'where fee.mr_date between :dt1 and :dt2'
      'group by ac_master.ac_name')
    Left = 609
    Top = 16
    ParamData = <
      item
        DataType = ftDate
        Name = 'dt1'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'dt2'
        Value = nil
      end>
    object qryacheadAC_NAME: TStringField
      FieldName = 'AC_NAME'
    end
    object qryacheadsum_amt: TCurrencyField
      FieldName = 'SUM_AMT'
    end
  end
  object qryFee: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'select ac_no, ac_name, ac_mode'
      'from ac_master'
      'where  ac_mandatory = true')
    Left = 609
    Top = 64
    object qryFeeAC_NO: TFloatField
      FieldName = 'AC_NO'
    end
    object qryFeeAC_NAME: TStringField
      FieldName = 'AC_NAME'
    end
    object qryFeeAC_MODE: TStringField
      FieldName = 'AC_MODE'
      Size = 1
    end
  end
  object tbAcMasterS: TMyDataSource
    DataSet = tbAcMaster
    Left = 256
    Top = 8
  end
  object CLMast1S: TMyDataSource
    DataSet = ClMast1
    Left = 16
    Top = 296
  end
  object tbfeematrix1: TMyTable
    TableName = 'fee_matrix'
    MasterFields = 'code'
    DetailFields = 'FEE_PROF_CODE'
    MasterSource = dsFeeProf
    Connection = myconn
    Left = 320
    Top = 200
    object tbfeematrix1AC_NO: TFloatField
      FieldName = 'AC_NO'
      Required = True
    end
    object tbfeematrix1FEE_PROF_CODE: TSmallintField
      FieldName = 'FEE_PROF_CODE'
    end
    object tbfeematrix1FEE: TCurrencyField
      FieldName = 'FEE'
      Required = True
    end
    object tbfeematrix1AcDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'ACDESC'
      LookupDataSet = tbAcMaster
      LookupKeyFields = 'AC_NO'
      LookupResultField = 'AC_NAME'
      KeyFields = 'AC_NO'
      Lookup = True
    end
  end
  object dsttable: TMyDataSource
    DataSet = tbttable
    Left = 136
    Top = 344
  end
  object dsTeacher: TMyDataSource
    DataSet = tbTeacher
    Left = 136
    Top = 8
  end
  object QrMark: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'SELECT Studmast.StudID, Studmast.ClCode, Markdet.Term, Markdet.T' +
        'otmark, Studmast.Name'
      'FROM Markmast'
      '   INNER JOIN Studmast'
      '   ON  (Studmast.StudID = Markmast.Studid)  '
      '   INNER JOIN Markdet'
      '   ON  (Markmast.Studid = Markdet.StudId)  '
      'WHERE   (Studmast.ClCode =:class)  '
      '   AND  (Markdet.Term = :trm)  ')
    Left = 609
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'class'
        Value = nil
      end
      item
        DataType = ftString
        Name = 'trm'
        Value = nil
      end>
    object QrMarkStudID: TFloatField
      FieldName = 'STUDID'
    end
    object QrMarkClCode: TStringField
      FieldName = 'CLCODE'
      Size = 5
    end
    object QrMarkTerm: TStringField
      FieldName = 'TERM'
      Size = 2
    end
    object QrMarkTotmark: TFloatField
      FieldName = 'TOTMARK'
    end
    object QrMarkName: TStringField
      FieldName = 'NAME'
      Size = 40
    end
  end
  object QrTerm: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'SELECT DISTINCT Term'
      'FROM Markdet')
    Left = 665
    Top = 64
    object QrTermTerm: TStringField
      FieldName = 'TERM'
      Size = 2
    end
  end
  object QrStudMk: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'SELECT Studmast.StudID, Studmast.Name, Marksubdet.Term, Marksubd' +
        'et.Markobt, Subjmast.Subjname, Subjmast.Subjtot, Studmast.ClCode'
      'FROM Studmast'
      '   INNER JOIN Markmast'
      '   ON  (Studmast.StudID = Markmast.Studid)  '
      '   INNER JOIN Markdet'
      '   ON  (Markmast.Studid = Markdet.StudId)  '
      '   INNER JOIN Marksubdet'
      '   ON  (Markdet.SrlNo = Marksubdet.Rno)  '
      '   INNER JOIN Subjmast'
      '   ON  (Marksubdet.Subjcd = Subjmast.Subjcode)  '
      
        'where  Studmast.StudID=:sid and Studmast.ClCode=:cl and Marksubd' +
        'et.Term=:trm')
    Left = 609
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sid'
        Value = nil
      end
      item
        DataType = ftString
        Name = 'cl'
        Value = nil
      end
      item
        DataType = ftString
        Name = 'trm'
        Value = nil
      end>
    object QrStudMkStudID: TFloatField
      FieldName = 'STUDID'
    end
    object QrStudMkName: TStringField
      FieldName = 'NAME'
      Size = 40
    end
    object QrStudMkTerm: TStringField
      FieldName = 'TERM'
      Size = 2
    end
    object QrStudMkMarkobt: TFloatField
      FieldName = 'MARKOBT'
    end
    object QrStudMkSubjname: TStringField
      FieldName = 'SUBJNAME'
      Size = 15
    end
    object QrStudMkSubjtot: TFloatField
      FieldName = 'SUBJTOT'
    end
    object QrStudMkClCode: TStringField
      FieldName = 'CLCODE'
      Size = 5
    end
  end
  object QrAbsent: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'SELECT Studmast.StudID, Absentees."Date", Absentees.Absent, Stud' +
        'mast.ClCode, Studmast.Name'
      'FROM Studmast'
      '   INNER JOIN Absentees'
      '   ON  (Studmast.StudID = Absentees.StudId)  '
      
        'where Absentees.Absent=true and  Absentees.Dte between :sdt and ' +
        ':edt')
    Left = 665
    Top = 16
    ParamData = <
      item
        DataType = ftDate
        Name = 'sdt'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'edt'
        Value = nil
      end>
    object QrAbsentStudID: TFloatField
      FieldName = 'STUDID'
    end
    object QrAbsentDate: TDateField
      FieldName = 'DATE'
    end
    object QrAbsentAbsent: TBooleanField
      FieldName = 'ABSENT'
    end
    object QrAbsentClCode: TStringField
      FieldName = 'CLCODE'
      Size = 5
    end
    object QrAbsentName: TStringField
      FieldName = 'NAME'
      Size = 40
    end
  end
  object userds: TMyDataSource
    DataSet = usertb1
    Left = 16
    Top = 440
  end
  object dsBmast: TMyDataSource
    DataSet = tbBmast
    Left = 256
    Top = 296
  end
  object dsBrMast: TMyDataSource
    DataSet = tbBrmast
    Left = 256
    Top = 248
  end
  object qryIncme: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'select fee.mr_no, fee.billno, fee.mr_date, studmast.name, fee.fe' +
        'e_amt,'
      'fee.late_fee from fee'
      '   inner join  studmast'
      '   on  (studmast.studid = fee.studid)  '
      'where mr_date between :sdate and :edate')
    Left = 665
    Top = 112
    ParamData = <
      item
        DataType = ftDate
        Name = 'sdate'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'edate'
        Value = nil
      end>
  end
  object qryBank: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'SELECT Fee.CHQ_NO, Bmast.Descr, Brmast.Descr, Fee.CHQ_AMT'
      'FROM Fee'
      '   INNER JOIN  Bmast'
      '   ON  (Bmast.Bcode = Fee.DRAWN_ON)  '
      '   INNER JOIN  Brmast'
      '   ON  (Brmast.Bcode = Fee.Branch)  '
      'WHERE  Fee.CHQ_NO <> '#39#39' '
      'and MR_DATE between :sdate and :edate')
    Left = 609
    Top = 208
    ParamData = <
      item
        DataType = ftDate
        Name = 'sdate'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'edate'
        Value = nil
      end>
    object qryBankCHQ_NO: TStringField
      FieldName = 'CHQ_NO'
    end
    object qryBankDesc: TStringField
      FieldName = 'DESCR'
      Size = 30
    end
    object qryBankDesc_1: TStringField
      FieldName = 'DESCR_1'
      Size = 30
    end
    object qryBankCHQ_AMT: TCurrencyField
      FieldName = 'CHQ_AMT'
    end
  end
  object dsfeematrix1: TMyDataSource
    DataSet = tbfeematrix1
    Left = 256
    Top = 200
  end
  object qryPayroll: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'SELECT Empmast.Name, Empmast.AccNo, Trnsmst.MnthSal'
      'FROM  Trnsmst'
      '   INNER JOIN  Empmast'
      '   ON  (Empmast.EmpNo = Trnsmst.EmpNo)  '
      'where Trnsmst."Date" between :sdate and :edate')
    Left = 665
    Top = 208
    ParamData = <
      item
        DataType = ftDate
        Name = 'sdate'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'edate'
        Value = nil
      end>
  end
  object qryYrly: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'SELECT Name, AccNo, PFAcNo, PayScale, '
      'Basic,Basic*.45 DA,200 HRA,(basic+basic*.45+200) gross'
      'FROM Empmast')
    OnCalcFields = qryYrlyCalcFields
    Left = 665
    Top = 160
    object qryYrlyName: TStringField
      FieldName = 'NAME'
      Size = 40
    end
    object qryYrlyAccNo: TStringField
      FieldName = 'ACCNO'
      Size = 6
    end
    object qryYrlyPFAcNo: TStringField
      FieldName = 'PFACNO'
      Size = 6
    end
    object qryYrlyPayScale: TStringField
      FieldName = 'PAYSCALE'
      Size = 30
    end
    object qryYrlyBasic: TCurrencyField
      FieldName = 'BASIC'
    end
    object qryYrlyDA: TCurrencyField
      FieldName = 'DA'
    end
    object qryYrlyHRA: TFloatField
      FieldName = 'HRA'
      currency = True
    end
    object qryYrlygross: TCurrencyField
      FieldName = 'GROSS'
    end
    object qryYrlyPF: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PF'
      Calculated = True
    end
    object qryYrlyNetAmt: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'NetAmt'
      Calculated = True
    end
  end
  object TcData: TMyTable
    TableName = 'tcdata'
    Connection = myconn
    AfterInsert = TcDataAfterInsert
    BeforePost = TcDataBeforePost
    OnCalcFields = TcDataCalcFields
    Left = 320
    Top = 440
    object TcDataSlNo: TFloatField
      FieldName = 'SLNO'
      Origin = 'tcdata.SLNO'
    end
    object TcDataAdmNo: TStringField
      FieldName = 'ADMNO'
      Origin = 'tcdata.ADMNO'
      Size = 10
    end
    object TcDataDtLeft: TDateField
      FieldName = 'DTLEFT'
      Origin = 'tcdata.DTLEFT'
    end
    object TcDataCharacter: TStringField
      FieldName = 'CHARACTR'
      Origin = 'tcdata.CHARACTR'
      Size = 15
    end
    object TcDataYrFrom: TStringField
      FieldName = 'YRFROM'
      Origin = 'tcdata.YRFROM'
      Size = 15
    end
    object TcDataYrTo: TStringField
      FieldName = 'YRTO'
      Origin = 'tcdata.YRTO'
      Size = 15
    end
    object TcDataTcDate: TDateField
      FieldName = 'TCDATE'
      Origin = 'tcdata.TCDATE'
    end
    object TcDataPromotion: TStringField
      FieldName = 'PROMOTION'
      Origin = 'tcdata.PROMOTION'
      Size = 15
    end
    object TcDataOinfo: TMemoField
      FieldName = 'OINFO'
      Origin = 'tcdata.OINFO'
      BlobType = ftMemo
    end
    object TcDataSname: TStringField
      FieldKind = fkLookup
      FieldName = 'SNAME'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'NAME'
      KeyFields = 'ADMNO'
      Lookup = True
    end
    object TcDataSfName: TStringField
      FieldKind = fkLookup
      FieldName = 'SFNAME'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'FNAME'
      KeyFields = 'ADMNO'
      Size = 40
      Lookup = True
    end
    object TcDataSDoB: TDateField
      FieldKind = fkLookup
      FieldName = 'SDOB'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'DOB'
      KeyFields = 'ADMNO'
      Lookup = True
    end
    object TcDataSDoA: TDateField
      FieldKind = fkLookup
      FieldName = 'SDOA'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'DOA'
      KeyFields = 'ADMNO'
      Lookup = True
    end
    object TcDatasClass: TStringField
      FieldKind = fkLookup
      FieldName = 'sClass'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'cl_caption'
      KeyFields = 'ADMNO'
      Lookup = True
    end
    object TcDatasSchool: TStringField
      FieldKind = fkLookup
      FieldName = 'SSCHOOL'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'SCHLAST'
      KeyFields = 'ADMNO'
      Lookup = True
    end
    object TcDataStName: TStringField
      FieldKind = fkLookup
      FieldName = 'STNAME'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'NAME'
      KeyFields = 'ADMNO'
      Size = 30
      Lookup = True
    end
    object TcDatareason: TStringField
      FieldName = 'reason'
      Origin = 'tcdata.reason'
      Size = 30
    end
    object TcDataschboard: TStringField
      FieldName = 'schboard'
      Origin = 'tcdata.schboard'
      Size = 40
    end
    object TcDatafailed: TStringField
      FieldName = 'failed'
      Origin = 'tcdata.failed'
      FixedChar = True
      Size = 3
    end
    object TcDatasubject: TStringField
      FieldName = 'subject'
      Origin = 'tcdata.subject'
      Size = 50
    end
    object TcDataprom: TStringField
      FieldName = 'prom'
      Origin = 'tcdata.prom'
      FixedChar = True
      Size = 3
    end
    object TcDatapromo_for: TStringField
      FieldName = 'promo_for'
      Origin = 'tcdata.promo_for'
      Size = 25
    end
    object TcDatafee_upto: TStringField
      FieldName = 'fee_upto'
      Origin = 'tcdata.fee_upto'
      Size = 25
    end
    object TcDatawork_days: TIntegerField
      FieldName = 'work_days'
      Origin = 'tcdata.work_days'
    end
    object TcDatapresent_days: TIntegerField
      FieldName = 'present_days'
      Origin = 'tcdata.present_days'
    end
    object TcDataNCC: TStringField
      FieldName = 'NCC'
      Origin = 'tcdata.NCC'
      FixedChar = True
      Size = 3
    end
    object TcDatagames: TStringField
      FieldName = 'games'
      Origin = 'tcdata.games'
      Size = 25
    end
    object TcDataconduct: TStringField
      FieldName = 'conduct'
      Origin = 'tcdata.conduct'
      Size = 25
    end
    object TcDatadoa: TDateField
      FieldName = 'doa'
      Origin = 'tcdata.doa'
    end
    object TcDatadoi: TDateField
      FieldName = 'doi'
      Origin = 'tcdata.doi'
    end
    object TcDataTCNO: TIntegerField
      FieldName = 'TCNO'
      Origin = 'tcdata.TCNO'
    end
    object TcDatasAdmno: TStringField
      FieldKind = fkLookup
      FieldName = 'sAdmno'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'ADMNO'
      KeyFields = 'ADMNO'
      Lookup = True
    end
    object TcDatascaste: TStringField
      FieldKind = fkLookup
      FieldName = 'scaste'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'CASTE'
      KeyFields = 'ADMNO'
      Lookup = True
    end
    object TcDataclword: TStringField
      FieldKind = fkCalculated
      FieldName = 'clword'
      Calculated = True
    end
    object TcDatac_feecat: TStringField
      FieldKind = fkCalculated
      FieldName = 'c_feecat'
      Calculated = True
    end
    object TcDatafeeprof: TStringField
      FieldKind = fkLookup
      FieldName = 'feeprof'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'FEE_PROF_DESCR'
      KeyFields = 'ADMNO'
      Size = 0
      Lookup = True
    end
    object TcDatadobinword: TStringField
      FieldKind = fkCalculated
      FieldName = 'dobinword'
      Size = 100
      Calculated = True
    end
    object TcDatamnthyr: TStringField
      FieldName = 'mnthyr'
    end
    object TcDataappexam: TStringField
      FieldName = 'appexam'
      Size = 25
    end
    object TcDatatcflag: TBooleanField
      FieldName = 'tcflag'
    end
  end
  object TcDataS: TMyDataSource
    DataSet = TcData
    Left = 256
    Top = 440
  end
  object birth: TMyTable
    TableName = 'birth'
    Connection = myconn
    Left = 320
    Top = 392
    object birthSlNo: TFloatField
      FieldName = 'SLNO'
      Origin = 'birth.SLNO'
    end
    object birthAdmNo: TFloatField
      FieldName = 'ADMNO'
      Origin = 'birth.ADMNO'
    end
    object birthComment: TMemoField
      FieldName = 'CMNT'
      Origin = 'birth.CMNT'
      BlobType = ftMemo
    end
    object birthsname: TStringField
      FieldKind = fkLookup
      FieldName = 'SNAME'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'NAME'
      KeyFields = 'ADMNO'
      Lookup = True
    end
    object birthsfName: TStringField
      FieldKind = fkLookup
      FieldName = 'SFNAME'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'FNAME'
      KeyFields = 'ADMNO'
      Lookup = True
    end
    object birthsDOB: TDateField
      FieldKind = fkLookup
      FieldName = 'SDOB'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'DOB'
      KeyFields = 'ADMNO'
      DisplayFormat = 'DDMMMMYYYY'
      Lookup = True
    end
    object birthIssuedte: TDateField
      FieldName = 'Issuedte'
      Origin = 'birth.Issuedte'
      DisplayFormat = 'DDMMMMYYYY'
    end
    object birthLastdte: TDateField
      FieldName = 'Lastdte'
      Origin = 'birth.Lastdte'
      DisplayFormat = 'DDMMMMYYYY'
    end
    object birthSDOA: TDateField
      FieldKind = fkLookup
      FieldName = 'SDOA'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'DOA'
      KeyFields = 'ADMNO'
      DisplayFormat = 'DDMMMMYYYY'
      Lookup = True
    end
  end
  object birthS: TMyDataSource
    DataSet = birth
    Left = 256
    Top = 392
  end
  object qryCllist: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'SELECT ClCode, Section, AdmNo, Name, RollNo, Fname, DOB,Phone, S' +
        'EX,mname,caste,descr fee_type '
      
        'FROM v_studmast studmast inner join fee_prof on studmast.FEE_PRO' +
        'F_CODE=fee_prof.code'
      ' where ClCode=:ccode and Section=:sec and Catcode<>0 '
      'ORDER BY ClCode, Section, AdmNo')
    Left = 713
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ccode'
        Value = nil
      end
      item
        DataType = ftString
        Name = 'sec'
        Value = nil
      end>
    object qryCllistClCode: TWordField
      FieldName = 'ClCode'
    end
    object qryCllistSection: TStringField
      FieldName = 'Section'
      Size = 2
    end
    object qryCllistAdmNo: TStringField
      FieldName = 'AdmNo'
      Size = 10
    end
    object qryCllistName: TStringField
      FieldName = 'Name'
      Size = 40
    end
    object qryCllistRollNo: TFloatField
      FieldName = 'RollNo'
    end
    object qryCllistFname: TStringField
      FieldName = 'Fname'
      Size = 40
    end
    object qryCllistDOB: TDateField
      FieldName = 'DOB'
    end
    object qryCllistPhone: TStringField
      FieldName = 'Phone'
    end
    object qryCllistSEX: TStringField
      FieldName = 'SEX'
      Size = 1
    end
    object qryCllistMNAME: TStringField
      FieldName = 'MNAME'
      Size = 40
    end
    object qryCllistCASTE: TStringField
      FieldName = 'CASTE'
      Size = 15
    end
    object qryCllistfee_type: TStringField
      FieldName = 'fee_type'
      Size = 30
    end
  end
  object QrByBus: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'SELECT StudID, Name, ClCode, RollNo, Section, GName, LAddr'
      'FROM studmast'
      'where bybus=true')
    Left = 609
    Top = 304
  end
  object QryFeeColl: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'select studmast.admno, studmast.name,clmast.descr, studmast.sect' +
        'ion, fee.fee_amt, fee.mr_no, '
      'fee.billno'
      'from fee'
      '   inner join studmast'
      '   on  (fee.studid = studmast.studid)  '
      '   inner join clmast'
      '   on  (studmast.clcode = clmast.clcode) '
      'where fee.mr_date between :dt1 and :dt2'
      'order by clmast.descr, studmast.section')
    Left = 769
    Top = 160
    ParamData = <
      item
        DataType = ftDate
        Name = 'dt1'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'dt2'
        Value = nil
      end>
  end
  object QryFeeColl1: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'SELECT Itemmast.Idesc'
      'FROM Fee_detail'
      '   INNER JOIN Itemmast'
      '   ON  (Fee_detail.AC_NO = Itemmast.ICode)  , Fee')
    Left = 718
    Top = 304
  end
  object QryDefaulter: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'select clmast.descr,studmast.section,admno, studmast.name,studma' +
        'st.noterms-:tm,clmast.mfee,'
      'clmast.adfee,studmast.studid'
      ''
      'from clmast'
      'inner join studmast'
      '   on  (clmast.clcode = studmast.clcode)  '
      '   inner join fee_matrix'
      
        '   on  (clmast.clcode = fee_matrix.std)  where   (fee_matrix.ac_' +
        'no = 1)  '
      '   and  (studmast.noterms <:trm)  and(studmast.catcode=1)'
      'order by clmast.descr,studmast.studid,studmast.admno')
    Left = 769
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tm'
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'trm'
        Value = nil
      end>
  end
  object QryFreeship: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'SELECT  ClMast.DESCR,Studmast.Section,Studmast.Name, Studmast.Ro' +
        'llNo, Studmast.GName, Studmast.LAddr'
      'FROM Studmast'
      '   INNER JOIN Clmast'
      '   ON  (Studmast.ClCode = Clmast.ClCode) '
      'WHERE  CatCode=2 ')
    Left = 769
    Top = 256
  end
  object Qrytotalstud: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'SELECT Clmast."Desc" Cldesc, Section, StudID, Name,  RollNo, Sec' +
        'tion, Fname, DOB, LAddr, Studmast."Cast", DOA, Sex'
      'FROM Studmast'
      '   INNER JOIN Clmast'
      '   ON  (Clmast.ClCode = Studmast.ClCode) '
      'WHERE StudMast.CatCode<>0'
      'ORDER BY Cldesc, Section,Studid'
      '')
    Left = 609
    Top = 256
  end
  object Qrhouse: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'SELECT Name, ClCode, RollNo, Section, DOB, Fname, Sex, LAddr, Ho' +
        'use'
      'FROM Studmast')
    Left = 721
    Top = 16
  end
  object QrFee: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'select fee.mr_no, studmast.clcode, studmast.section'
      'from studmast'
      '   inner join fee'
      
        '   on  (fee.studid = studmast.studid)  where fee.mr_date between' +
        ' :dt1 and :dt2 order by studmast.clcode, studmast.section')
    Left = 721
    Top = 112
    ParamData = <
      item
        DataType = ftDate
        Name = 'dt1'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'dt2'
        ParamType = ptInput
        Value = nil
      end>
    object QrFeeMR_NO: TFloatField
      FieldName = 'MR_NO'
    end
    object QrFeeClCode: TSmallintField
      FieldName = 'CLCODE'
    end
    object QrFeeSection: TStringField
      FieldName = 'SECTION'
      Size = 2
    end
  end
  object qrStudHist: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'SELECT MR_NO, NOTERM,TERM,MR_DATE, (FEE_AMT+LATE_FEE) Tamt,CHQ_N' +
        'O,bmast.DESCR bank,brmast.DESCR branch,if(adhoc=2,'#39'C'#39','#39#39') canc'
      'FROM fee'
      'inner join bmast on fee.DRAWN_ON=bmast.BCODE'
      'left join brmast on fee.BRANCH=brmast.BCODE'
      'Where studid=:stid'
      'ORDER BY MR_DATE')
    Left = 721
    Top = 64
    ParamData = <
      item
        DataType = ftFloat
        Name = 'stid'
        Value = nil
      end>
    object qrStudHistMR_NO: TStringField
      FieldName = 'MR_NO'
      Size = 14
    end
    object qrStudHistTamt: TCurrencyField
      FieldName = 'TAMT'
    end
    object qrStudHistNOTERM: TFloatField
      FieldName = 'NOTERM'
    end
    object qrStudHistTERM: TSmallintField
      FieldName = 'TERM'
    end
    object qrStudHistMR_DATE: TDateField
      FieldName = 'MR_DATE'
    end
    object qrStudHistCHQ_NO: TStringField
      FieldName = 'CHQ_NO'
    end
    object qrStudHistbank: TStringField
      FieldName = 'bank'
      Size = 30
    end
    object qrStudHistbranch: TStringField
      FieldName = 'branch'
      Size = 30
    end
    object qrStudHistcanc: TStringField
      FieldName = 'canc'
      Size = 1
    end
  end
  object DsStud_Det: TMyDataSource
    DataSet = TbStud_Det
    Left = 256
    Top = 488
  end
  object QrTc: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'SELECT Tcdata.AdmNo, Tcdata.TcDate, Tcdata.DtLeft, Studmast.ClCo' +
        'de, Studmast.Name, Studmast.Section, Studmast.RollNo'
      'FROM Tcdata'
      '   INNER JOIN Studmast'
      '   ON  (Tcdata.AdmNo = Studmast.StudID)  ')
    Left = 721
    Top = 160
    object QrTcAdmNo: TFloatField
      FieldName = 'ADMNO'
    end
    object QrTcTcDate: TDateField
      FieldName = 'TCDATE'
    end
    object QrTcDtLeft: TDateField
      FieldName = 'DTLEFT'
    end
    object QrTcClCode: TSmallintField
      FieldName = 'CLCODE'
    end
    object QrTcName: TStringField
      FieldName = 'NAME'
      Size = 40
    end
    object QrTcSection: TStringField
      FieldName = 'SECTION'
      Size = 2
    end
    object QrTcRollNo: TFloatField
      FieldName = 'ROLLNO'
    end
  end
  object QrTotAdm: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'SELECT StudID, Name, ClCode, Section, DOB, Fname'
      'FROM studmast where DOA between :dt1 and :dt2')
    Left = 769
    Top = 112
    ParamData = <
      item
        DataType = ftDate
        Name = 'dt1'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'dt2'
        Value = nil
      end>
    object QrTotAdmStudID: TFloatField
      FieldName = 'STUDID'
    end
    object QrTotAdmName: TStringField
      FieldName = 'NAME'
      Size = 40
    end
    object QrTotAdmClCode: TSmallintField
      FieldName = 'CLCODE'
    end
    object QrTotAdmSection: TStringField
      FieldName = 'SECTION'
      Size = 2
    end
    object QrTotAdmDOB: TDateField
      FieldName = 'DOB'
    end
    object QrTotAdmFname: TStringField
      FieldName = 'FNAME'
      Size = 40
    end
  end
  object qryItem: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'SELECT Items.descr,count(items.descr) cnt,sum(Amount) amt'
      'FROM trans'
      '   INNER JOIN ITEMS'
      '   ON  (items.ItemCode = trans.ItemCode)  '
      'where trdate between :dt1 and :dt2'
      'GROUP BY items.descr')
    Left = 769
    Top = 16
    ParamData = <
      item
        DataType = ftDate
        Name = 'dt1'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'dt2'
        Value = nil
      end>
  end
  object qryMiscList: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'SELECT TransNo,TrDate,Class,Name,Amount'
      'FROM trans'
      'where trdate between :dt1 and :dt2')
    Left = 769
    Top = 64
    ParamData = <
      item
        DataType = ftDate
        Name = 'dt1'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'dt2'
        Value = nil
      end>
  end
  object qryClrep: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'SELECT Clmast.Descr,sum(Fee.FEE_AMT) amt'
      ''
      'FROM Fee'
      '   INNER JOIN Studmast'
      '   ON  (Fee.StudID = Studmast.StudID)  '
      '   INNER JOIN Clmast'
      '   ON  (Studmast.ClCode = Clmast.ClCode) '
      'where fee.mr_date between :dt1 and :dt2'
      'group  BY Clmast.Descr')
    Left = 670
    Top = 304
    ParamData = <
      item
        DataType = ftDate
        Name = 'dt1'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'dt2'
        Value = nil
      end>
  end
  object qryFeeacc: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'select clmast.descr, studmast.section, studmast.studid,'
      'studmast.name,sum(fee.fee_amt) amt'
      'from fee'
      '   inner join studmast'
      '   on  (fee.studid = studmast.studid)  '
      '   inner join clmast'
      '   on  (studmast.clcode = clmast.clcode) '
      'where fee.mr_date between :dt1 and :dt2'
      
        'group by clmast.descr, studmast.section,studmast.studid,studmast' +
        '.name'
      
        'order by clmast.descr, studmast.section,studmast.studid,studmast' +
        '.name')
    Left = 665
    Top = 256
    ParamData = <
      item
        DataType = ftDate
        Name = 'dt1'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'dt2'
        Value = nil
      end>
  end
  object dsSubMast: TMyDataSource
    DataSet = tbSubMast
    Left = 136
    Top = 56
  end
  object dsSubDet: TMyDataSource
    DataSet = tbSubdet
    Left = 136
    Top = 104
  end
  object dsClassDet: TMyDataSource
    DataSet = tbClassDet
    Left = 136
    Top = 152
  end
  object dsqry: TMyDataSource
    DataSet = qryclstud
    Left = 606
    Top = 357
  end
  object qryclstud: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'SELECT studmast.StudID,studmast.Name, Studmast.ClCode,studmast.R' +
        'ollNo,CLMast.clCaption,'
      'CLMast.Descr'
      'FROM Studmast'
      'INNER JOIN clmast'
      'ON (Studmast.clcode=clmast.clcode)'
      'WHERE studmast.clcode = :cl'
      'Order By Studmast.clcode')
    Left = 679
    Top = 412
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'cl'
        Value = nil
      end>
    object qryclstudStudID: TFloatField
      FieldName = 'STUDID'
    end
    object qryclstudName: TStringField
      FieldName = 'NAME'
      Size = 40
    end
    object qryclstudClCode: TSmallintField
      FieldName = 'CLCODE'
    end
    object qryclstudRollNo: TFloatField
      FieldName = 'ROLLNO'
    end
    object qryclstudclCaption: TStringField
      FieldName = 'CLCAPTION'
      Size = 10
    end
    object qryclstudDesc: TStringField
      FieldName = 'DESCR'
      Size = 15
    end
  end
  object dsqrytabul: TMyDataSource
    DataSet = qtab
    Left = 668
    Top = 358
  end
  object qtab: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'SELECT Studmast.studID, Studmast.Name, Studmast.ClCode, studmark' +
        'det.Srlno, studmarkdet.Mobt, Clmast.Clcaption,clsubdet.subdesc,c' +
        'lsubdet.TotalMarks,clsubdet.passmarks'
      'FROM Studmast'
      '   INNER JOIN Clmast'
      '   ON  (Studmast.ClCode = Clmast.ClCode)  '
      '   INNER JOIN studmarkdet'
      '   ON  (Studmast.studID = studmarkdet.studid)  '
      '   INNER JOIN clsubdet'
      '    ON(studmarkdet.srlno=clsubdet.slno)'
      '   ')
    Left = 726
    Top = 357
    object qtabstudID: TFloatField
      FieldName = 'STUDID'
    end
    object qtabName: TStringField
      FieldName = 'NAME'
      Size = 40
    end
    object qtabClCode: TSmallintField
      FieldName = 'CLCODE'
    end
    object qtabSrlno: TFloatField
      FieldName = 'SRLNO'
    end
    object qtabMobt: TSmallintField
      FieldName = 'MOBT'
    end
    object qtabClcaption: TStringField
      FieldName = 'CLCAPTION'
      Size = 10
    end
    object qtabsubdesc: TStringField
      FieldName = 'SUBDESC'
    end
    object qtabTotalMarks: TSmallintField
      FieldName = 'TOTALMARKS'
    end
    object qtabpassmarks: TSmallintField
      FieldName = 'PASSMARKS'
    end
    object qtabtmarks: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tmarks'
      Calculated = True
    end
  end
  object qryLkUp: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'SELECT AdmNo,Remark,Descr,studmast.clcode,UpGrdYr '
      'FROM studmast'
      'INNER JOIN clmast'
      'ON (studmast.clcode=clmast.clcode)'
      'WHERE catcode<>0'
      'AND studmast.clcode BETWEEN :frm AND :to'
      'and (UpGrdYr <>:dte or UpGrdYr is NULL)')
    Left = 426
    Top = 813
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'frm'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'to'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'dte'
        ParamType = ptInput
        Value = nil
      end>
    object qryLkUpRemark: TMemoField
      FieldName = 'REMARK'
      BlobType = ftMemo
      Size = 20
    end
    object qryLkUpDesc: TStringField
      FieldName = 'DESCR'
      Size = 4
    end
    object qryLkUpclcode: TSmallintField
      FieldName = 'CLCODE'
    end
    object qryLkUpUpGrdYr: TStringField
      FieldName = 'UPGRDYR'
      Size = 2
    end
    object qryLkUpAdmNo: TStringField
      FieldName = 'ADMNO'
      Size = 10
    end
  end
  object qryLkUpD: TMyDataSource
    DataSet = qryLkUp
    Left = 370
    Top = 813
  end
  object dsSubDet1: TMyDataSource
    DataSet = tbSubDet1
    Left = 136
    Top = 296
  end
  object TbStud_Det: TMyTable
    TableName = 'stud_det'
    Connection = myconn
    Left = 320
    Top = 488
    object TbStud_DetName: TStringField
      FieldKind = fkLookup
      FieldName = 'NAME'
      LookupDataSet = studmast
      LookupKeyFields = 'ADMNO'
      LookupResultField = 'NAME'
      KeyFields = 'ADMNO'
      Lookup = True
    end
    object TbStud_DetClCode: TSmallintField
      FieldName = 'CLCODE'
    end
    object TbStud_DetDet: TBooleanField
      FieldName = 'DET'
    end
    object TbStud_DetClDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'CLDESC'
      LookupDataSet = studmast
      LookupKeyFields = 'ADMNO'
      LookupResultField = 'stClDesc'
      KeyFields = 'ADMNO'
      Lookup = True
    end
    object TbStud_DetAdmNo: TStringField
      FieldName = 'ADMNO'
      Size = 10
    end
  end
  object Query1: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'SELECT StudID, Name, ClCaption, Section, Fname, DOB, DOA'
      'FROM studmast'
      '   INNER JOIN clmast'
      '   ON  (clmast.ClCode = studmast.ClCode) '
      'WHERE studmast.CatCode<>0'
      'ORDER BY Studid')
    Left = 717
    Top = 256
    object QrytotalstudStudID: TFloatField
      FieldName = 'STUDID'
    end
    object QrytotalstudName: TStringField
      FieldName = 'NAME'
      Size = 40
    end
    object QrytotalstudClCaption: TStringField
      FieldName = 'CLCAPTION'
      Size = 10
    end
    object QrytotalstudSection: TStringField
      FieldName = 'SECTION'
      Size = 2
    end
    object QrytotalstudFname: TStringField
      FieldName = 'FNAME'
      Size = 40
    end
    object QrytotalstudDOB: TDateField
      FieldName = 'DOB'
    end
    object QrytotalstudDOA: TDateField
      FieldName = 'DOA'
    end
  end
  object dsClassDet1: TMyDataSource
    DataSet = tbClassDet1
    Left = 134
    Top = 248
  end
  object dsTeacher1: TMyDataSource
    DataSet = tbTeacher1
    Left = 136
    Top = 200
  end
  object dsttable1: TMyDataSource
    DataSet = tbttable1
    Left = 137
    Top = 392
  end
  object dsttable2: TMyDataSource
    DataSet = tbttable2
    Left = 137
    Top = 438
  end
  object dsTabsent: TMyDataSource
    DataSet = tbTabsent
    Left = 136
    Top = 486
  end
  object ActionList1: TActionList
    Left = 76
    Top = 11
    object dsIns: TAction
      Caption = '&New'
      OnExecute = dsInsExecute
    end
    object dsSav: TAction
      Caption = '&Save'
      Enabled = False
      OnExecute = dsSavExecute
    end
    object dsAdmIns: TAction
      Caption = '&New'
      OnExecute = dsAdmInsExecute
    end
    object dsAdmSav: TAction
      Caption = '&Save'
      Enabled = False
      OnExecute = dsAdmSavExecute
    end
    object dsAdmInsXI: TAction
      Caption = 'New'
      OnExecute = dsAdmInsXIExecute
    end
    object dsAdmSavXI: TAction
      Caption = 'Save'
      Enabled = False
      OnExecute = dsAdmSavXIExecute
    end
  end
  object dummyT: TMyTable
    TableName = 'dummy'
    Connection = myconn
    Left = 760
    Top = 598
    object AutoIncField1: TAutoIncField
      FieldName = 'ITEMCODE'
      ReadOnly = True
    end
    object StringField2: TStringField
      FieldName = 'DESCR'
      Size = 30
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'RTE'
    end
  end
  object StfApplnT: TMyTable
    TableName = 'stfappln'
    Connection = myconn
    AfterOpen = StfApplnTAfterEdit
    AfterInsert = StfApplnTAfterInsert
    AfterEdit = StfApplnTAfterEdit
    AfterPost = StfApplnTAfterEdit
    BeforeCancel = StfApplnTBeforeCancel
    AfterCancel = StfApplnTAfterEdit
    BeforeDelete = StfApplnTBeforeDelete
    AfterDelete = StfApplnTAfterEdit
    Left = 438
    Top = 8
    object StfApplnTAppln_No: TIntegerField
      FieldName = 'APPLN_NO'
    end
    object StfApplnTJob_1: TStringField
      DisplayWidth = 15
      FieldName = 'JOB_1'
    end
    object StfApplnTName_1: TStringField
      DisplayWidth = 25
      FieldName = 'NAME_1'
      Size = 25
    end
    object StfApplnTDOB: TDateField
      FieldName = 'DOB'
    end
    object StfApplnTAddr_1: TMemoField
      FieldName = 'ADDR_1'
      BlobType = ftMemo
      Size = 5
    end
    object StfApplnTTel_No_1: TStringField
      FieldName = 'TEL_NO_1'
      Size = 15
    end
    object StfApplnTPOB: TStringField
      FieldName = 'POB'
      Size = 15
    end
    object StfApplnTNationality: TStringField
      FieldName = 'NATIONALITY'
      Size = 15
    end
    object StfApplnTMar_Stat: TStringField
      FieldName = 'MAR_STAT'
      Size = 10
    end
    object StfApplnTChild_No: TSmallintField
      FieldName = 'CHILD_NO'
    end
    object StfApplnTName_2: TStringField
      FieldName = 'NAME_2'
      Size = 25
    end
    object StfApplnTOccupation: TStringField
      FieldName = 'OCCUPATION'
      Size = 15
    end
    object StfApplnTAddr_2: TMemoField
      FieldName = 'ADDR_2'
      BlobType = ftMemo
      Size = 5
    end
    object StfApplnTTel_No_2: TStringField
      FieldName = 'TEL_NO_2'
      Size = 15
    end
    object StfApplnTPhoto: TGraphicField
      FieldName = 'PHOTO'
      BlobType = ftGraphic
    end
    object StfApplnTScholarship: TMemoField
      FieldName = 'SCHOLARSHIP'
      BlobType = ftMemo
      Size = 5
    end
    object StfApplnTResearch: TMemoField
      FieldName = 'RESEARCH'
      BlobType = ftMemo
      Size = 5
    end
    object StfApplnTTot_Ex: TFloatField
      FieldName = 'TOT_EX'
    end
    object StfApplnTTeach_Ex: TFloatField
      FieldName = 'TEACH_EX'
    end
    object StfApplnTAdmin_Ex: TFloatField
      FieldName = 'ADMIN_EX'
    end
    object StfApplnTOther_Ex: TFloatField
      FieldName = 'OTHER_EX'
    end
    object StfApplnTCurr_Orgn: TMemoField
      FieldName = 'CURR_ORGN'
      BlobType = ftMemo
      Size = 5
    end
    object StfApplnTCurr_Post: TStringField
      FieldName = 'CURR_POST'
      Size = 15
    end
    object StfApplnTDOJ: TDateField
      FieldName = 'DOJ'
    end
    object StfApplnTPost_Place: TStringField
      FieldName = 'POST_PLACE'
      Size = 15
    end
    object StfApplnTTot_Pay: TCurrencyField
      FieldName = 'TOT_PAY'
    end
    object StfApplnTBasic: TCurrencyField
      FieldName = 'BASIC'
    end
    object StfApplnTAllowances: TCurrencyField
      FieldName = 'ALLOWANCES'
    end
    object StfApplnTOthers: TCurrencyField
      FieldName = 'OTHERS'
    end
    object StfApplnTBond_: TStringField
      FieldName = 'BOND_1'
      Size = 3
    end
    object StfApplnTBond_Det: TMemoField
      FieldName = 'BOND_DET'
      BlobType = ftMemo
      Size = 5
    end
    object StfApplnTTime_to_Join: TFloatField
      FieldName = 'TIME_TO_JOIN'
    end
    object StfApplnTIllness: TStringField
      FieldName = 'ILLNESS'
      Size = 3
    end
    object StfApplnTIll_Det: TMemoField
      FieldName = 'ILL_DET'
      BlobType = ftMemo
      Size = 5
    end
    object StfApplnTLaw_Case: TStringField
      FieldName = 'LAW_CASE'
      Size = 3
    end
    object StfApplnTCase_Det: TMemoField
      FieldName = 'CASE_DET'
      BlobType = ftMemo
      Size = 5
    end
    object StfApplnTStatement: TMemoField
      FieldName = 'STATEMENT'
      BlobType = ftMemo
      Size = 5
    end
    object StfApplnTInterests: TMemoField
      FieldName = 'INTERESTS'
      BlobType = ftMemo
      Size = 5
    end
    object StfApplnTAppln_Date: TDateField
      FieldName = 'APPLN_DATE'
    end
    object StfApplnTPath: TStringField
      FieldName = 'PATH'
      Size = 30
    end
  end
  object StfApplnD: TMyDataSource
    DataSet = StfApplnT
    Left = 385
    Top = 8
  end
  object AcdT: TMyTable
    TableName = 'acadprof'
    MasterFields = 'APPLN_NO'
    DetailFields = 'APPLN_NO'
    MasterSource = StfApplnD
    Connection = myconn
    Filtered = True
    Filter = 'Flag='#39'a'#39
    BeforePost = AcdTBeforePost
    Left = 438
    Top = 152
    object AcdTAPPLN_NO: TLargeintField
      FieldName = 'APPLN_NO'
    end
    object AcdTSl_No: TSmallintField
      FieldName = 'SL_NO'
    end
    object AcdTFlag: TStringField
      FieldName = 'FLAG'
      Size = 1
    end
    object AcdTQualfn: TStringField
      FieldName = 'QUALFN'
      Size = 15
    end
    object AcdTSubj: TStringField
      FieldName = 'SUBJ'
      Size = 15
    end
    object AcdTInstitute: TStringField
      FieldName = 'INSTITUTE'
      Size = 35
    end
    object AcdTYEAR: TIntegerField
      FieldName = 'YEAR'
    end
    object AcdTMarks: TFloatField
      FieldName = 'MARKS'
    end
    object AcdTDiv: TStringField
      FieldName = 'DIVN'
      Size = 5
    end
  end
  object AcdD: TMyDataSource
    DataSet = AcdT
    Left = 385
    Top = 152
  end
  object ProT: TMyTable
    TableName = 'acadprof'
    MasterFields = 'APPLN_NO'
    DetailFields = 'APPLN_NO'
    MasterSource = StfApplnD
    Connection = myconn
    Filtered = True
    Filter = 'Flag='#39'p'#39
    BeforePost = ProTBeforePost
    Left = 437
    Top = 200
    object ProTAppln_No: TIntegerField
      FieldName = 'APPLN_NO'
    end
    object ProTSl_No: TSmallintField
      FieldName = 'SL_NO'
    end
    object ProTFlag: TStringField
      FieldName = 'FLAG'
      Size = 1
    end
    object ProTQualfn: TStringField
      FieldName = 'QUALFN'
      Size = 15
    end
    object ProTSubj: TStringField
      FieldName = 'SUBJ'
      Size = 15
    end
    object ProTInstitute: TStringField
      FieldName = 'INSTITUTE'
      Size = 35
    end
    object ProTYear: TDateField
      FieldName = 'YEAR'
    end
    object ProTMarks: TFloatField
      FieldName = 'MARKS'
    end
    object ProTDiv: TStringField
      FieldName = 'DIVN'
      Size = 5
    end
  end
  object ProD: TMyDataSource
    DataSet = ProT
    Left = 385
    Top = 200
  end
  object BooksT: TMyTable
    TableName = 'books'
    MasterFields = 'APPLN_NO'
    DetailFields = 'APPL_NO'
    MasterSource = StfApplnD
    Connection = myconn
    Left = 438
    Top = 56
    object BooksTAppl_No: TIntegerField
      FieldName = 'APPL_NO'
    end
    object BooksTSl_No: TSmallintField
      FieldName = 'SL_NO'
    end
    object BooksTTitle: TStringField
      FieldName = 'TITLE'
      Size = 35
    end
    object BooksTAuthors: TStringField
      FieldName = 'AUTHORS'
      Size = 15
    end
  end
  object dsBooks: TMyDataSource
    DataSet = BooksT
    Left = 385
    Top = 56
  end
  object RefsD: TMyDataSource
    DataSet = RefsT
    Left = 385
    Top = 104
  end
  object RefsT: TMyTable
    TableName = 'refs'
    MasterFields = 'APPLN_NO'
    DetailFields = 'APPL_NO'
    MasterSource = StfApplnD
    Connection = myconn
    Left = 438
    Top = 104
    object RefsTAppl_No: TIntegerField
      FieldName = 'APPL_NO'
    end
    object RefsTName: TStringField
      FieldName = 'NAME'
      Size = 15
    end
    object RefsTOccupation: TStringField
      FieldName = 'OCCUPATION'
      Size = 15
    end
    object RefsTAddr: TStringField
      FieldName = 'ADDR'
      Size = 255
    end
    object RefsTTel_No: TStringField
      FieldName = 'TEL_NO'
      Size = 15
    end
    object RefsTSlNo: TSmallintField
      FieldName = 'SLNO'
    end
  end
  object Lang1T: TMyTable
    TableName = 'lang'
    MasterFields = 'APPLN_NO'
    DetailFields = 'APPLN_NO'
    MasterSource = StfApplnD
    Connection = myconn
    Filtered = True
    Filter = 'Tb_Flag='#39'p'#39
    BeforePost = Lang1TBeforePost
    Left = 441
    Top = 248
    object Lang1TAppln_No: TIntegerField
      FieldName = 'APPLN_NO'
    end
    object Lang1TSl_No: TSmallintField
      FieldName = 'SL_NO'
    end
    object Lang1TTb_Flag: TStringField
      FieldName = 'TB_FLAG'
      Size = 1
    end
    object Lang1TLanguage: TStringField
      FieldName = 'LANGUAGE'
      Size = 15
    end
    object Lang1TRead: TStringField
      FieldName = 'LREAD'
      Size = 3
    end
    object Lang1TWrite: TStringField
      FieldName = 'LWRITE'
      Size = 3
    end
    object Lang1TSpeak: TStringField
      FieldName = 'LSPEAK'
      Size = 3
    end
  end
  object Lang1D: TMyDataSource
    DataSet = Lang1T
    Left = 385
    Top = 248
  end
  object Lang2D: TMyDataSource
    DataSet = Lang2T
    Left = 385
    Top = 296
  end
  object Lang2T: TMyTable
    TableName = 'lang'
    MasterFields = 'APPLN_NO'
    DetailFields = 'APPLN_NO'
    MasterSource = StfApplnD
    Connection = myconn
    BeforePost = Lang2TBeforePost
    Left = 441
    Top = 296
    object Lang2TAppln_No: TIntegerField
      FieldName = 'APPLN_NO'
    end
    object Lang2TSl_No: TSmallintField
      FieldName = 'SL_NO'
    end
    object Lang2TTb_Flag: TStringField
      FieldName = 'TB_FLAG'
      Size = 1
    end
    object Lang2TLanguage: TStringField
      FieldName = 'LANGUAGE'
      Size = 15
    end
    object Lang2TRead: TStringField
      FieldName = 'LREAD'
      Size = 3
    end
    object Lang2TWrite: TStringField
      FieldName = 'LWRITE'
      Size = 3
    end
    object Lang2TSpeak: TStringField
      FieldName = 'LSPEAK'
      Size = 3
    end
  end
  object WorkExT: TMyTable
    TableName = 'workex'
    MasterFields = 'APPLN_NO'
    DetailFields = 'APPLN_NO'
    MasterSource = StfApplnD
    Connection = myconn
    Left = 441
    Top = 344
    object WorkExTAppln_No: TIntegerField
      FieldName = 'APPLN_NO'
    end
    object WorkExTSl_No: TSmallintField
      FieldName = 'SL_NO'
    end
    object WorkExTInstitute: TStringField
      FieldName = 'INSTITUTE'
      Size = 35
    end
    object WorkExTFrom: TDateField
      FieldName = 'DFROM'
    end
    object WorkExTTo: TDateField
      FieldName = 'DTO'
    end
    object WorkExTPost: TStringField
      FieldName = 'POST'
      Size = 15
    end
    object WorkExTSubj_Cls: TStringField
      FieldName = 'SUBJ_CLS'
      Size = 15
    end
  end
  object WorkExD: TMyDataSource
    DataSet = WorkExT
    Left = 385
    Top = 344
  end
  object SemCorD: TMyDataSource
    DataSet = SemCorT
    Left = 385
    Top = 392
  end
  object SemCorT: TMyTable
    TableName = 'semcor'
    MasterFields = 'APPLN_NO'
    DetailFields = 'APPLN_NO'
    MasterSource = StfApplnD
    Connection = myconn
    Left = 441
    Top = 392
    object SemCorTAppln_No: TIntegerField
      FieldName = 'APPLN_NO'
    end
    object SemCorTSl_No: TSmallintField
      FieldName = 'SL_NO'
    end
    object SemCorTSeminar: TStringField
      FieldName = 'SEMINAR'
      Size = 15
    end
    object SemCorTDuration: TFloatField
      FieldName = 'DURATION'
    end
    object SemCorTDates: TDateField
      FieldName = 'DATES'
    end
    object SemCorTDesc: TStringField
      FieldName = 'DESCR'
      Size = 35
    end
  end
  object RdBtnValD: TMyDataSource
    DataSet = RdBtnValT
    Left = 17
    Top = 491
  end
  object RdBtnValT: TMyTable
    TableName = 'rdbtnval'
    Connection = myconn
    Left = 77
    Top = 491
    object RdBtnValTFieldName: TStringField
      FieldName = 'FIELDNAME'
      Size = 30
    end
  end
  object myconn: TMyConnection
    Database = 'jps'
    DataTypeMap = <
      item
        DBType = 209
        FieldType = ftLargeint
      end>
    Username = 'root'
    Server = 'localhost'
    ConnectDialog = MyConnectDialog1
    LoginPrompt = False
    Left = 16
    Top = 8
    EncryptedPassword = '88FF9AFF93FF9CFF90FF92FF9AFF'
  end
  object tbClmast: TMyTable
    TableName = 'tbclmast'
    Connection = myconn
    Left = 72
    Top = 56
    object tbClmastCLCODE: TSmallintField
      FieldName = 'CLCODE'
      Origin = 'tbclmast.CLCODE'
    end
    object tbClmastDESCR: TStringField
      FieldName = 'DESCR'
      Origin = 'tbclmast.DESCR'
      Size = 15
    end
  end
  object tbClmastS: TMyDataSource
    DataSet = tbClmast
    Left = 16
    Top = 56
  end
  object ClMastS: TMyDataSource
    DataSet = ClMast
    Left = 16
    Top = 152
  end
  object ClMast: TMyTable
    TableName = 'clmast'
    Connection = myconn
    Left = 72
    Top = 152
    object ClMastCLCODE: TSmallintField
      FieldName = 'CLCODE'
      Origin = 'clmast.CLCODE'
    end
    object ClMastCLCAPTION: TStringField
      FieldName = 'CLCAPTION'
      Origin = 'clmast.CLCAPTION'
      Size = 10
    end
    object ClMastDESCR: TStringField
      FieldName = 'DESCR'
      Origin = 'clmast.DESCR'
      Size = 15
    end
    object ClMastMFEE: TFloatField
      FieldName = 'MFEE'
      Origin = 'clmast.MFEE'
    end
    object ClMastUPCLASS: TSmallintField
      FieldName = 'UPCLASS'
      Origin = 'clmast.UPCLASS'
    end
    object ClMastADFEE: TFloatField
      FieldName = 'ADFEE'
      Origin = 'clmast.ADFEE'
    end
    object ClMastage: TSmallintField
      FieldName = 'age'
      Origin = 'clmast.age'
    end
  end
  object catgrmastS: TMyDataSource
    DataSet = catgrmast
    Left = 16
    Top = 248
  end
  object catgrmast: TMyTable
    TableName = 'catgrmast'
    Connection = myconn
    Left = 72
    Top = 248
    object catgrmastCATCODE: TSmallintField
      FieldName = 'CATCODE'
      Origin = 'catgrmast.CATCODE'
    end
    object catgrmastDESCR: TStringField
      FieldName = 'DESCR'
      Origin = 'catgrmast.DESCR'
    end
    object catgrmastNOPAY: TBooleanField
      FieldName = 'NOPAY'
      Origin = 'catgrmast.NOPAY'
    end
  end
  object studmastS: TMyDataSource
    DataSet = studmast
    Left = 16
    Top = 104
  end
  object studmast: TMyTable
    TableName = 'studmast'
    Connection = myconn
    AfterOpen = studmastAfterEdit
    AfterInsert = studmastAfterInsert
    AfterEdit = studmastAfterEdit
    BeforePost = studmastBeforePost
    AfterPost = studmastAfterEdit
    AfterCancel = studmastAfterEdit
    AfterDelete = studmastAfterEdit
    OnCalcFields = studmastCalcFields
    Left = 72
    Top = 104
    object studmastSTUDID: TFloatField
      FieldName = 'STUDID'
      Origin = 'studmast.STUDID'
      EditFormat = '####/##'
    end
    object studmastADMNO: TStringField
      FieldName = 'ADMNO'
      Origin = 'studmast.ADMNO'
      Size = 10
    end
    object studmastNAME: TStringField
      FieldName = 'NAME'
      Origin = 'studmast.NAME'
      Size = 40
    end
    object studmastCLCODE: TSmallintField
      FieldName = 'CLCODE'
      Origin = 'studmast.CLCODE'
    end
    object studmastROLLNO: TFloatField
      FieldName = 'ROLLNO'
      Origin = 'studmast.ROLLNO'
    end
    object studmastSECTION: TStringField
      FieldName = 'SECTION'
      Origin = 'studmast.SECTION'
      Size = 2
    end
    object studmastDOB: TDateField
      FieldName = 'DOB'
      Origin = 'studmast.DOB'
      OnValidate = studmastDOBValidate
    end
    object studmastSEX: TStringField
      FieldName = 'SEX'
      Origin = 'studmast.SEX'
      Size = 1
    end
    object studmastGNAME: TStringField
      FieldName = 'GNAME'
      Origin = 'studmast.GNAME'
      Size = 40
    end
    object studmastFNAME: TStringField
      FieldName = 'FNAME'
      Origin = 'studmast.FNAME'
      Size = 40
    end
    object studmastMNAME: TStringField
      FieldName = 'MNAME'
      Origin = 'studmast.MNAME'
      Size = 40
    end
    object studmastLADDR: TMemoField
      FieldName = 'LADDR'
      Origin = 'studmast.LADDR'
      BlobType = ftMemo
    end
    object studmastPADDR: TMemoField
      FieldName = 'PADDR'
      Origin = 'studmast.PADDR'
      BlobType = ftMemo
    end
    object studmastCATCODE: TFloatField
      FieldName = 'CATCODE'
      Origin = 'studmast.CATCODE'
    end
    object studmastDOA: TDateField
      FieldName = 'DOA'
      Origin = 'studmast.DOA'
    end
    object studmastAGE: TStringField
      FieldName = 'AGE'
      Origin = 'studmast.AGE'
    end
    object studmastNOTERMS: TFloatField
      FieldName = 'NOTERMS'
      Origin = 'studmast.NOTERMS'
    end
    object studmastPHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'studmast.PHONE'
    end
    object studmastPHOTO: TBlobField
      FieldName = 'PHOTO'
      Origin = 'studmast.PHOTO'
    end
    object studmastEML: TStringField
      FieldName = 'EML'
      Origin = 'studmast.EML'
      Size = 35
    end
    object studmastM_PHONE: TStringField
      FieldName = 'M_PHONE'
      Origin = 'studmast.M_PHONE'
    end
    object studmastRELIGION: TStringField
      FieldName = 'RELIGION'
      Origin = 'studmast.RELIGION'
      Size = 15
    end
    object studmastCASTE: TStringField
      FieldName = 'CASTE'
      Origin = 'studmast.CASTE'
      Size = 15
    end
    object studmastF_OCCP: TStringField
      FieldName = 'F_OCCP'
      Origin = 'studmast.F_OCCP'
      Size = 40
    end
    object studmastF_QUAL: TStringField
      FieldName = 'F_QUAL'
      Origin = 'studmast.F_QUAL'
      Size = 40
    end
    object studmastM_QUAL: TStringField
      FieldName = 'M_QUAL'
      Origin = 'studmast.M_QUAL'
    end
    object studmastM_OCCP: TStringField
      FieldName = 'M_OCCP'
      Origin = 'studmast.M_OCCP'
    end
    object studmastSCHLAST: TStringField
      FieldName = 'SCHLAST'
      Origin = 'studmast.SCHLAST'
      Size = 30
    end
    object studmastBLOODGROUP: TStringField
      FieldName = 'BLOODGROUP'
      Origin = 'studmast.BLOODGROUP'
      Size = 15
    end
    object studmastHOUSE: TStringField
      FieldName = 'HOUSE'
      Origin = 'studmast.HOUSE'
      Size = 25
    end
    object studmastMTOUNGE: TStringField
      FieldName = 'MTOUNGE'
      Origin = 'studmast.MTOUNGE'
      Size = 15
    end
    object studmastBYBUS: TBooleanField
      FieldName = 'BYBUS'
      Origin = 'studmast.BYBUS'
    end
    object studmastREMARK: TMemoField
      FieldName = 'REMARK'
      Origin = 'studmast.REMARK'
      BlobType = ftMemo
    end
    object studmastUPGRDYR: TStringField
      FieldName = 'UPGRDYR'
      Origin = 'studmast.UPGRDYR'
      Size = 2
    end
    object studmastADM_CL: TSmallintField
      FieldName = 'ADM_CL'
      Origin = 'studmast.ADM_CL'
    end
    object studmastPATH: TStringField
      FieldName = 'PATH'
      Origin = 'studmast.PATH'
      Size = 30
    end
    object studmastAmd_cl_desc: TStringField
      FieldKind = fkLookup
      FieldName = 'Amd_cl_desc'
      LookupDataSet = ClMast
      LookupKeyFields = 'CLCODE'
      LookupResultField = 'DESCR'
      KeyFields = 'ADM_CL'
      Lookup = True
    end
    object studmastcl_caption: TStringField
      FieldKind = fkLookup
      FieldName = 'cl_caption'
      LookupDataSet = ClMast
      LookupKeyFields = 'CLCODE'
      LookupResultField = 'CLCAPTION'
      KeyFields = 'CLCODE'
      Lookup = True
    end
    object studmastcatDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'catDesc'
      LookupDataSet = catgrmast
      LookupKeyFields = 'CATCODE'
      LookupResultField = 'DESCR'
      KeyFields = 'CATCODE'
      Lookup = True
    end
    object studmaststMfee: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'stMfee'
      LookupDataSet = ClMast
      LookupKeyFields = 'CLCODE'
      LookupResultField = 'MFEE'
      KeyFields = 'CLCODE'
      Lookup = True
    end
    object studmaststClDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'stClDesc'
      LookupDataSet = ClMast
      LookupKeyFields = 'CLCODE'
      LookupResultField = 'DESCR'
      KeyFields = 'CLCODE'
      Lookup = True
    end
    object studmastcage: TStringField
      FieldKind = fkCalculated
      FieldName = 'cage'
      Size = 40
      Calculated = True
    end
    object studmastdbfilterstr: TStringField
      FieldKind = fkCalculated
      FieldName = 'dbfilterstr'
      Calculated = True
    end
    object studmastFEE_PROF_CODE: TSmallintField
      FieldName = 'FEE_PROF_CODE'
      Origin = 'studmast.FEE_PROF_CODE'
    end
    object studmastFEE_PROF_DESCR: TStringField
      FieldKind = fkLookup
      FieldName = 'FEE_PROF_DESCR'
      LookupDataSet = tbFeeProf
      LookupKeyFields = 'code'
      LookupResultField = 'descr'
      KeyFields = 'FEE_PROF_CODE'
      Lookup = True
    end
    object studmastNOFSB: TStringField
      FieldName = 'NOFSB'
      Origin = 'studmast.NOFSB'
      Size = 100
    end
    object studmastG_OCCP: TStringField
      FieldName = 'G_OCCP'
      Origin = 'studmast.G_OCCP'
      Size = 40
    end
    object studmastG_QUAL: TStringField
      FieldName = 'G_QUAL'
      Origin = 'studmast.G_QUAL'
      Size = 40
    end
    object studmastGREL: TIntegerField
      FieldName = 'GREL'
      Origin = 'studmast.GREL'
    end
    object studmastGCOMP: TIntegerField
      FieldName = 'GCOMP'
      Origin = 'studmast.GCOMP'
    end
    object studmastCMP_PNO: TStringField
      FieldName = 'CMP_PNO'
      Origin = 'studmast.CMP_PNO'
    end
    object studmastCMP_DEPT: TStringField
      FieldName = 'CMP_DEPT'
      Origin = 'studmast.CMP_DEPT'
      Size = 25
    end
    object studmastRelDescr: TStringField
      FieldKind = fkLookup
      FieldName = 'RelDescr'
      LookupDataSet = tbRelmast
      LookupKeyFields = 'relcode'
      LookupResultField = 'relinfo'
      KeyFields = 'GREL'
      Lookup = True
    end
    object studmastcomp: TStringField
      FieldKind = fkLookup
      FieldName = 'comp'
      LookupDataSet = tbComp
      LookupKeyFields = 'cmp_id'
      LookupResultField = 'cmpname'
      KeyFields = 'GCOMP'
      Lookup = True
    end
    object studmastBSDT: TStringField
      FieldName = 'BSDT'
      Origin = 'studmast.BSDT'
      Size = 12
    end
    object studmastLIBFINE: TFloatField
      FieldName = 'LIBFINE'
      Origin = 'studmast.LIBFINE'
    end
    object studmastTRANSMODE: TStringField
      FieldName = 'TRANSMODE'
      Origin = 'studmast.TRANSMODE'
      Size = 25
    end
    object studmastFSERVADDR: TMemoField
      FieldName = 'FSERVADDR'
      Origin = 'studmast.FSERVADDR'
      BlobType = ftMemo
    end
    object studmastMSERVADDR: TMemoField
      FieldName = 'MSERVADDR'
      Origin = 'studmast.MSERVADDR'
      BlobType = ftMemo
    end
    object studmastGSERVADDR: TMemoField
      FieldName = 'GSERVADDR'
      Origin = 'studmast.GSERVADDR'
      BlobType = ftMemo
    end
    object studmasthandicap: TIntegerField
      FieldName = 'handicap'
      Origin = 'studmast.handicap'
    end
    object studmastidmark: TStringField
      FieldName = 'idmark'
      Origin = 'studmast.idmark'
      Size = 50
    end
    object studmastdisease: TStringField
      FieldName = 'disease'
      Origin = 'studmast.disease'
      Size = 25
    end
    object studmasthandicapDescr: TStringField
      FieldKind = fkLookup
      FieldName = 'handicapDescr'
      LookupDataSet = tbHandicap
      LookupKeyFields = 'id'
      LookupResultField = 'descr'
      KeyFields = 'handicap'
      Lookup = True
    end
    object studmasttc_status: TIntegerField
      FieldName = 'tc_status'
      Origin = 'studmast.tc_status'
    end
    object studmasttcStatDescr: TStringField
      FieldKind = fkLookup
      FieldName = 'tcStatDescr'
      LookupDataSet = tcstatus
      LookupKeyFields = 'id'
      LookupResultField = 'tcstatus'
      KeyFields = 'tc_status'
      Lookup = True
    end
    object studmastuidno: TStringField
      FieldName = 'uidno'
      Origin = 'studmast.uidno'
      Size = 15
    end
    object studmastNSO: TBooleanField
      FieldName = 'NSO'
    end
    object studmastM_PHONE1: TStringField
      FieldName = 'M_PHONE1'
      Size = 10
    end
    object studmastnso_dt: TDateField
      FieldName = 'nso_dt'
    end
  end
  object tmpClmastS: TMyDataSource
    DataSet = tmpClmast
    Left = 16
    Top = 200
  end
  object tmpClmast: TMyTable
    TableName = 'clmast'
    Connection = myconn
    Left = 72
    Top = 200
    object tmpClmastclcode: TWordField
      FieldName = 'clcode'
    end
  end
  object ClMast1: TMyTable
    TableName = 'clmast'
    Connection = myconn
    Left = 72
    Top = 296
    object ClMast1CLCODE: TSmallintField
      FieldName = 'CLCODE'
    end
    object ClMast1CLCAPTION: TStringField
      FieldName = 'CLCAPTION'
      Size = 10
    end
    object ClMast1DESCR: TStringField
      FieldName = 'DESCR'
      Size = 15
    end
    object ClMast1MFEE: TFloatField
      FieldName = 'MFEE'
    end
    object ClMast1UPCLASS: TSmallintField
      FieldName = 'UPCLASS'
    end
    object ClMast1ADFEE: TFloatField
      FieldName = 'ADFEE'
    end
    object ClMast1CLDESC: TStringField
      FieldKind = fkLookup
      FieldName = 'CLDESC'
      LookupDataSet = ClMast
      LookupKeyFields = 'CLCODE'
      LookupResultField = 'CLCAPTION'
      KeyFields = 'UPCLASS'
      Lookup = True
    end
    object ClMast1age: TSmallintField
      FieldName = 'age'
    end
  end
  object tbBrmast: TMyTable
    TableName = 'brmast'
    Connection = myconn
    Left = 320
    Top = 248
    object tbBrmastBCODE: TSmallintField
      FieldName = 'BCODE'
      Origin = 'brmast.BCODE'
    end
    object tbBrmastDESCR: TStringField
      FieldName = 'DESCR'
      Origin = 'brmast.DESCR'
      Size = 30
    end
  end
  object tbBmast: TMyTable
    TableName = 'bmast'
    Connection = myconn
    Left = 320
    Top = 296
    object tbBmastBCODE: TSmallintField
      FieldName = 'BCODE'
      Origin = 'bmast.BCODE'
    end
    object tbBmastDESCR: TStringField
      FieldName = 'DESCR'
      Origin = 'bmast.DESCR'
      Size = 30
    end
  end
  object dsgmast: TMyTable
    TableName = 'dsgmast'
    Connection = myconn
    AfterCancel = AcdTBeforePost
    Left = 72
    Top = 344
    object dsgmastDCODE: TFloatField
      FieldName = 'DCODE'
    end
    object dsgmastDESCR: TStringField
      FieldName = 'DESCR'
      Size = 25
    end
  end
  object ItemMast: TMyTable
    TableName = 'itemmast'
    Connection = myconn
    Left = 320
    Top = 344
    object ItemMastICODE: TLargeintField
      FieldName = 'ICODE'
    end
    object ItemMastIDESC: TStringField
      FieldName = 'IDESC'
      Size = 35
    end
    object ItemMastCHARGE: TFloatField
      FieldName = 'CHARGE'
    end
  end
  object DepMast: TMyTable
    TableName = 'depmast'
    Connection = myconn
    Left = 72
    Top = 392
    object DepMastDCODE: TFloatField
      FieldName = 'DCODE'
    end
    object DepMastDESCR: TStringField
      FieldName = 'DESCR'
    end
  end
  object tbttable: TMyTable
    TableName = 'ttable'
    Connection = myconn
    Left = 192
    Top = 344
    object tbttablePERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object tbttableDAY: TSmallintField
      FieldName = 'DAY'
    end
    object tbttableCCODE: TSmallintField
      FieldName = 'CCODE'
    end
    object tbttableTEACHER: TSmallintField
      FieldName = 'TEACHER'
    end
    object tbttableSID: TSmallintField
      FieldName = 'SID'
    end
    object tbttabletchname: TStringField
      FieldKind = fkLookup
      FieldName = 'tchname'
      LookupDataSet = tbTeacher
      LookupKeyFields = 'TID'
      LookupResultField = 'DESCR'
      KeyFields = 'TEACHER'
      Lookup = True
    end
    object tbttablesname: TStringField
      FieldKind = fkLookup
      FieldName = 'sname'
      LookupDataSet = tbTeacher
      LookupKeyFields = 'TID'
      LookupResultField = 'DESCR'
      KeyFields = 'TEACHER'
      Lookup = True
    end
    object tbttabledname: TStringField
      FieldKind = fkCalculated
      FieldName = 'dname'
      Calculated = True
    end
    object tbttablesubdesc: TStringField
      FieldKind = fkLookup
      FieldName = 'subdesc'
      LookupDataSet = tbSubMast
      LookupKeyFields = 'SID'
      LookupResultField = 'DESCR'
      KeyFields = 'SID'
      Lookup = True
    end
    object tbttablecldesc: TStringField
      FieldKind = fkLookup
      FieldName = 'cldesc'
      LookupDataSet = ClMast
      LookupKeyFields = 'CLCODE'
      LookupResultField = 'DESCR'
      KeyFields = 'CCODE'
      Lookup = True
    end
    object tbttabletchabname: TStringField
      FieldKind = fkLookup
      FieldName = 'tchabname'
      LookupDataSet = tbTeacher
      LookupKeyFields = 'TID'
      LookupResultField = 'ABNAME'
      KeyFields = 'TEACHER'
      Lookup = True
    end
  end
  object tbTeacher: TMyTable
    TableName = 'teacher'
    Connection = myconn
    OnCalcFields = tbTeacherCalcFields
    Left = 192
    Top = 8
    object tbTeacherTID: TFloatField
      FieldName = 'TID'
    end
    object tbTeacherDESCR: TStringField
      FieldName = 'DESCR'
    end
    object tbTeacherSUB1: TStringField
      FieldName = 'SUB1'
    end
    object tbTeacherSUB2: TStringField
      FieldName = 'SUB2'
    end
    object tbTeacherABS: TStringField
      FieldName = 'ABS'
      Size = 1
    end
    object tbTeacherABNAME: TStringField
      FieldName = 'ABNAME'
      Size = 5
    end
  end
  object tbSubMast: TMyTable
    TableName = 'submast'
    Connection = myconn
    Left = 192
    Top = 56
    object tbSubMastSID: TSmallintField
      FieldName = 'SID'
    end
    object tbSubMastCID: TSmallintField
      FieldName = 'CID'
    end
    object tbSubMastDESCR: TStringField
      FieldName = 'DESCR'
      Size = 15
    end
    object tbSubMastTOTALMARKS: TSmallintField
      FieldName = 'TOTALMARKS'
    end
    object tbSubMastPASSMARKS: TSmallintField
      FieldName = 'PASSMARKS'
    end
  end
  object tbSubdet: TMyTable
    TableName = 'subdet'
    MasterFields = 'TID'
    DetailFields = 'TID'
    MasterSource = dsTeacher
    Connection = myconn
    Left = 192
    Top = 104
    object tbSubdetTID: TSmallintField
      FieldName = 'TID'
    end
    object tbSubdetSID: TSmallintField
      FieldName = 'SID'
    end
    object tbSubdetSLNO: TIntegerField
      FieldName = 'SLNO'
    end
    object tbSubdetsubdesc: TStringField
      FieldKind = fkLookup
      FieldName = 'subdesc'
      LookupDataSet = tbSubMast
      LookupKeyFields = 'SID'
      LookupResultField = 'DESCR'
      KeyFields = 'sid'
      Lookup = True
    end
  end
  object tbClassDet: TMyTable
    TableName = 'classdet'
    MasterFields = 'SLNO'
    DetailFields = 'SLNO'
    MasterSource = dsSubDet
    Connection = myconn
    Left = 192
    Top = 152
    object tbClassDetSLNO: TSmallintField
      FieldName = 'SLNO'
    end
    object tbClassDetCID: TSmallintField
      FieldName = 'CID'
    end
    object tbClassDetcldesc: TStringField
      FieldKind = fkLookup
      FieldName = 'cldesc'
      LookupDataSet = ClMast
      LookupKeyFields = 'CLCODE'
      LookupResultField = 'DESCR'
      KeyFields = 'CID'
      Lookup = True
    end
  end
  object tbTeacher1: TMyTable
    TableName = 'teacher'
    Connection = myconn
    OnCalcFields = tbTeacherCalcFields
    Left = 192
    Top = 200
    object tbTeacher1TID: TFloatField
      FieldName = 'TID'
    end
    object tbTeacher1DESCR: TStringField
      FieldName = 'DESCR'
    end
    object tbTeacher1SUB1: TStringField
      FieldName = 'SUB1'
    end
    object tbTeacher1SUB2: TStringField
      FieldName = 'SUB2'
    end
    object tbTeacher1ABS: TStringField
      FieldName = 'ABS'
      Size = 1
    end
    object tbTeacher1ABNAME: TStringField
      FieldName = 'ABNAME'
      Size = 5
    end
  end
  object tbClassDet1: TMyTable
    TableName = 'classdet'
    MasterFields = 'SLNO'
    DetailFields = 'SLNO'
    MasterSource = dsSubDet
    Connection = myconn
    Left = 192
    Top = 248
    object tbClassDet1SLNO: TSmallintField
      FieldName = 'SLNO'
    end
    object tbClassDet1CID: TSmallintField
      FieldName = 'CID'
    end
  end
  object tbSubDet1: TMyTable
    TableName = 'subdet'
    MasterFields = 'TID'
    DetailFields = 'TID'
    MasterSource = dsTeacher
    Connection = myconn
    Left = 192
    Top = 296
    object tbSubDet1TID: TSmallintField
      FieldName = 'TID'
    end
    object tbSubDet1SID: TSmallintField
      FieldName = 'SID'
    end
    object tbSubDet1SLNO: TIntegerField
      FieldName = 'SLNO'
    end
    object tbSubDet1subdesc: TStringField
      FieldKind = fkLookup
      FieldName = 'subdesc'
      LookupDataSet = tbSubMast
      LookupKeyFields = 'SID'
      LookupResultField = 'DESCR'
      KeyFields = 'SID'
      Lookup = True
    end
  end
  object usertb1: TMyTable
    TableName = 'usertb'
    Connection = myconn
    Left = 72
    Top = 440
    object usertb1UID: TStringField
      FieldName = 'UID'
      Size = 5
    end
    object usertb1UNAME: TStringField
      FieldName = 'UNAME'
      Size = 15
    end
    object usertb1PASSWD: TStringField
      FieldName = 'PASSWD'
      Size = 7
    end
    object usertb1STAT: TFloatField
      FieldName = 'STAT'
    end
    object usertb1UNO: TIntegerField
      FieldName = 'UNO'
    end
    object usertb1role_id: TIntegerField
      FieldName = 'role_id'
    end
    object usertb1role_descr: TStringField
      FieldKind = fkLookup
      FieldName = 'role_descr'
      LookupDataSet = tbRoles
      LookupKeyFields = 'role_id'
      LookupResultField = 'role'
      KeyFields = 'role_id'
      Lookup = True
    end
  end
  object tbttable1: TMyTable
    TableName = 'ttable'
    Connection = myconn
    Left = 192
    Top = 392
    object tbttable1PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object tbttable1DAY: TSmallintField
      FieldName = 'DAY'
    end
    object tbttable1CCODE: TSmallintField
      FieldName = 'CCODE'
    end
    object tbttable1TEACHER: TSmallintField
      FieldName = 'TEACHER'
    end
    object tbttable1SID: TSmallintField
      FieldName = 'SID'
    end
    object tbttable1tchname: TStringField
      FieldKind = fkLookup
      FieldName = 'tchname'
      LookupDataSet = tbTeacher
      LookupKeyFields = 'TID'
      LookupResultField = 'DESCR'
      KeyFields = 'TEACHER'
      Lookup = True
    end
    object tbttable1subdesc: TStringField
      FieldKind = fkLookup
      FieldName = 'subdesc'
      LookupDataSet = tbSubMast
      LookupKeyFields = 'SID'
      LookupResultField = 'DESCR'
      KeyFields = 'SID'
      Lookup = True
    end
  end
  object tbttable2: TMyTable
    TableName = 'ttable'
    Connection = myconn
    Left = 192
    Top = 440
    object tbttable2PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object tbttable2DAY: TSmallintField
      FieldName = 'DAY'
    end
    object tbttable2CCODE: TSmallintField
      FieldName = 'CCODE'
    end
    object tbttable2TEACHER: TSmallintField
      FieldName = 'TEACHER'
    end
    object tbttable2SID: TSmallintField
      FieldName = 'SID'
    end
    object tbttable2tchname: TStringField
      FieldKind = fkLookup
      FieldName = 'tchname'
      LookupDataSet = tbTeacher
      LookupKeyFields = 'TID'
      LookupResultField = 'DESCR'
      KeyFields = 'TEACHER'
      Lookup = True
    end
    object tbttable2subdesc: TStringField
      FieldKind = fkLookup
      FieldName = 'subdesc'
      LookupDataSet = tbSubMast
      LookupKeyFields = 'SID'
      LookupResultField = 'DESCR'
      KeyFields = 'SID'
      Lookup = True
    end
    object tbttable2cldesc: TStringField
      FieldKind = fkLookup
      FieldName = 'cldesc'
      LookupDataSet = ClMast
      LookupKeyFields = 'CLCODE'
      LookupResultField = 'DESCR'
      KeyFields = 'CCODE'
      Lookup = True
    end
  end
  object tbTabsent: TMyTable
    TableName = 'tabsent'
    Connection = myconn
    Left = 192
    Top = 488
    object tbTabsentSLNO: TLargeintField
      FieldName = 'SLNO'
    end
    object tbTabsentDTE: TDateField
      FieldName = 'DTE'
    end
    object tbTabsentTID: TSmallintField
      FieldName = 'TID'
    end
    object tbTabsenttchname: TStringField
      FieldKind = fkLookup
      FieldName = 'tchname'
      LookupDataSet = tbTeacher
      LookupKeyFields = 'TID'
      LookupResultField = 'DESCR'
      KeyFields = 'TID'
      Lookup = True
    end
  end
  object tbAcMaster: TMyTable
    TableName = 'ac_master'
    Connection = myconn
    Left = 320
    Top = 8
    object tbAcMasterAC_NO: TFloatField
      FieldName = 'AC_NO'
      Origin = 'ac_master.AC_NO'
    end
    object tbAcMasterAC_NAME: TStringField
      FieldName = 'AC_NAME'
      Origin = 'ac_master.AC_NAME'
    end
    object tbAcMasterAC_MODE: TStringField
      FieldName = 'AC_MODE'
      Origin = 'ac_master.AC_MODE'
      Size = 1
    end
    object tbAcMasterAC_MANDATORY: TBooleanField
      FieldName = 'AC_MANDATORY'
      Origin = 'ac_master.AC_MANDATORY'
    end
    object tbAcMasterAC_CODE: TStringField
      FieldName = 'AC_CODE'
      Origin = 'ac_master.AC_CODE'
      Size = 9
    end
    object tbAcMasterAC_DEF: TBooleanField
      FieldName = 'AC_DEF'
    end
  end
  object qryfeehdws: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'Select * from fee_detail inner join on')
    Left = 921
    Top = 160
    object FloatField1: TFloatField
      FieldName = 'AC_NO'
    end
    object StringField1: TStringField
      FieldName = 'AC_NAME'
    end
    object StringField3: TStringField
      FieldName = 'AC_MODE'
      Size = 1
    end
  end
  object qryfeehdwise: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'select fee.mr_no, clmast.descr, studmast.section,fee_detail.ac_n' +
        'o,fee_detail.ac_amtpaid, studmast.admno, studmast.name'
      'from fee '
      '   inner join studmast'
      '   on  (studmast.studid= fee.studid)'
      '   inner join clmast'
      '   on (studmast.clcode=clmast.clcode)'
      '   inner join fee_detail'
      '   on (fee_detail.mr_no=fee.mr_no)'
      'where fee.mr_date between :dt1 and :dt2 '
      'order by fee.mr_date,fee.mr_no')
    Left = 921
    Top = 208
    ParamData = <
      item
        DataType = ftDate
        Name = 'dt1'
        ParamType = ptInput
        Value = 40210d
      end
      item
        DataType = ftDate
        Name = 'dt2'
        ParamType = ptInput
        Value = 40312d
      end>
    object qryfeehdwisemr_no: TStringField
      FieldName = 'mr_no'
      Size = 14
    end
    object qryfeehdwisedescr: TStringField
      FieldName = 'descr'
      Size = 15
    end
    object qryfeehdwisesection: TStringField
      FieldName = 'section'
      Size = 2
    end
    object qryfeehdwiseac_no: TFloatField
      FieldName = 'ac_no'
    end
    object qryfeehdwiseac_amtpaid: TFloatField
      FieldName = 'ac_amtpaid'
    end
    object qryfeehdwiseadmno: TStringField
      FieldName = 'admno'
      Size = 10
    end
    object qryfeehdwisename: TStringField
      FieldName = 'name'
      Size = 40
    end
  end
  object mysp_gettmpno: TMyStoredProc
    StoredProcName = 'get_tmp_mrno'
    Connection = myconn
    SQL.Strings = (
      'SELECT get_tmp_mrno()')
    Left = 528
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'Result'
        ParamType = ptResult
        Size = 14
        Value = nil
      end>
    CommandStoredProcName = 'get_tmp_mrno'
  end
  object mysp_setmrno: TMyStoredProc
    StoredProcName = 'setfinalmr'
    Connection = myconn
    SQL.Strings = (
      
        'CALL setfinalmr(:`tmpmrno`, @`mrno`); SELECT @`mrno` AS '#39'@`mrno`' +
        #39)
    Left = 528
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = '`tmpmrno`'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = '`mrno`'
        ParamType = ptOutput
        Value = nil
      end>
    CommandStoredProcName = 'setfinalmr'
  end
  object spdefaulter: TMyStoredProc
    StoredProcName = 'defaulter_filter'
    Connection = myconn
    SQL.Strings = (
      'CALL defaulter_filter(:curterm, :p_diff, :p_opt)')
    Left = 528
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'curterm'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'p_diff'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'p_opt'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'defaulter_filter'
    object spdefaulteradmno: TStringField
      FieldName = 'admno'
      Size = 10
    end
    object spdefaultername: TStringField
      FieldName = 'name'
      Size = 40
    end
    object spdefaulternoterms: TFloatField
      FieldName = 'noterms'
    end
    object spdefaulterdiff: TFloatField
      FieldName = 'diff'
    end
    object spdefaulterclcaption: TStringField
      FieldName = 'clcaption'
      Size = 10
    end
    object spdefaulterac_name: TStringField
      FieldName = 'ac_name'
    end
    object spdefaulterfee: TFloatField
      FieldName = 'fee'
    end
    object spdefaulteramt: TFloatField
      FieldName = 'amt'
    end
    object spdefaulterROLLNO: TFloatField
      FieldName = 'ROLLNO'
    end
    object spdefaulterSECTION: TStringField
      FieldName = 'SECTION'
      Size = 2
    end
  end
  object spdefaulterS: TMyDataSource
    DataSet = spdefaulter
    Left = 816
    Top = 600
  end
  object frxDBbirth: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'frxDBbirth'
    CloseDataSource = False
    FieldAliases.Strings = (
      'sadmno=sadmno'
      'sname=SNAME'
      'sfname=SFNAME'
      'sdob=SDOB'
      'sdoa=SDOA'
      'sclass=sclass'
      'saclass=saclass'
      'sschool=sschool'
      'scaste=scaste'
      'slno=SLNO'
      'tcno=tcno'
      'dtleft=dtleft'
      'charactr=charactr'
      'yrfrom=yrfrom'
      'yrto=yrto'
      'tcdate=tcdate'
      'promotion=promotion'
      'oinfo=oinfo'
      'reason=reason'
      'schboard=schboard'
      'failed=failed'
      'subject=subject'
      'prom=prom'
      'promo_for=promo_for'
      'fee_upto=fee_upto'
      'work_days=work_days'
      'present_days=present_days'
      'ncc=ncc'
      'games=games'
      'conduct=conduct'
      'doi=doi'
      'feeprof=feeprof'
      'clword=clword'
      'c_feecat=c_feecat'
      'dobinword=dobinword'
      'doa=doa')
    DataSet = qryTcdata
    BCDToCurrency = False
    Left = 656
    Top = 560
  end
  object frxmyrepo: TfrxReport
    Version = '6.3.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41095.823892430600000000
    ReportOptions.LastChange = 43088.407575208300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 600
    Top = 544
    Datasets = <
      item
        DataSet = frxDBAdmStudXI
        DataSetName = 'frxDBAdmStudXI'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 8.000000000000000000
      BottomMargin = 2.000000000000000000
      BackPicture.Data = {
        0D546478536D617274496D616765FFD8FFE000104A4649460001010100960096
        0000FFE109B64578696600004D4D002A00000008000701120003000000010001
        0000011A00050000000100000062011B0005000000010000006A012800030000
        000100020000013100020000001C0000007201320002000000140000008E8769
        000400000001000000A2000000C20096032D000100000096032D000100004164
        6F62652050686F746F73686F70204353332057696E646F777300323031353A30
        323A30372031313A34343A3031000002A0020004000000010000026CA0030004
        000000010000036D0000000000000006010300030000000100060000011A0005
        0000000100000110011B00050000000100000118012800030000000100020000
        02010004000000010000012002020004000000010000088E0000000000000048
        000000010000004800000001FFD8FFE000104A46494600010200004800480000
        FFED000C41646F62655F434D0001FFEE000E41646F626500648000000001FFDB
        0084000C08080809080C09090C110B0A0B11150F0C0C0F151813131513131811
        0C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11
        110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0CFFC000110800A0007103012200021101031101FFDD00040008FFC401
        3F0000010501010101010100000000000000030001020405060708090A0B0100
        010501010101010100000000000000010002030405060708090A0B1000010401
        030204020507060805030C330100021103042112310541516113227181320614
        91A1B14223241552C16233347282D14307259253F0E1F163733516A2B2832644
        93546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4
        A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F71100
        0202010204040304050607070605350100021103213112044151617122130532
        819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B28307
        2635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4
        E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA
        000C03010002110311003F00F5363195B1B5D6D0C63006B5AD10001A35AD6852
        492494A492492529255ACB1C1ECF6B9E1EE2DF6980D03DBB9D1FCA46F4DBE2EF
        F38FF7A4A6692ABEA10D2482244B7DCED75D7F3BF352167B67BCC1F71E23E9FD
        2FA2929B492156D0E6C976ED625AE747FD528D84B6D656D6BC87CCBC38C37E32
        52527494584968279E0FC468A49294924924A524924929FFD0F5549249252924
        924948D8E681048065C60F938A85758B039EF73A4B9C34738001AE2C1A348FDD
        5070974364BC93034890E796CCFF00691A8FA07FAEFF00FAB724A4770A6901CE
        F50826043DDFF93433763000FE97DDA8F7BBB18FDF52CFFE6D9FD6FE05471F1E
        AB696B9E0C891A123BA4A532DC67B8307A80BB412F747E0F562824D7A9920B9B
        2793B5C5BAFDCA8B5A1B941A380F80ACB2ED9EC8925CF235E7DEFDC929357F47
        E67F295350AFE8FCCFE52A69294924924A524924929FFFD1F554924925292492
        494D3B36C99891BB6C9883BAC3274F77D15628FA07FAEFFF00AB72058448D3E8
        971D6751B9DE613FDA052C12D2EDCFB38F279494ACFF00E6D9FD6FE05576FDA3
        633D2DDB60CEDF1928B9560B31EB78112EE0FC1CABBCFE8EB07801C63CF71494
        929A6E3731CE6BB99738A3031EDD3F48E70D79D1EFE3DA50E8C5B4595D9036F3
        CF6844130E8036C9DE7B81BDF058929B35FD1F9BBF295251AFE8FCDDF94A924A
        5249249294924924A7FFD2F554924925292492494D57F222277100C41D5C7FC2
        FF00DF10727E833FAF6FFD5AB62B63D8770D49709EFF0048A11A3D7AF476D2D7
        D9E6357B92535DF630E357583EF69923EF4E2A2FAD8439AD8DC21C63F3913EC0
        EFF483EEFF006A77E0BC8600E1ED041247727724A438BA64B23C4831F02ADD55
        35DEF74921CE813110F721D386FAED6BDCE0437B0FB91A8FE6CFF59FFF0054E4
        94CABFA3F377E52A6A15FD1F99FCA54D25292492494A49249253FFD3F5549249
        2529249249480FAB1159882FDDE3ACB9AA06879325AD24F24F27FAC5587318E3
        2449F14DE957E092907A00B18E6B44903783A6BF34F5D03710F60E011A77EE8D
        E957E097A55F824A6B0A5C4EDDAC91A3801A7D19DC27F948B58B585A1D019110
        040113E03E8A27A6CF04BD2AFF007424A555F401F1923E04CA9A4924A5249249
        294924924A7FFFD4F554924925292492494C4BDA0C1E7C0027F226F51BE7FE69
        FEE4235DAF2D732CD81AF7178FDE13B23FCD4437D6096EA48D0ED6B8EBFD9092
        97F51BE07FCD3FDC97A8DF3FF34FF72AD2434805D2E1AFB5E00333A7B53EE76D
        DB2E8991A3F8FDDFA0929B1EA37CFF00CD3FDC97AACE4C81E24103F22832EADA
        236B8796D79FFBEA4E6BECB2BB6BB22B1A968821D2929324A1568C03B0903E00
        C29A4A5249249294924924A7FFD5F554924925292492494805C19ED8992EEE07
        2E778A9D1F40FF005DFF00F56E41791B835DF449709004FD27773F451A8FA07F
        AEFF00FAB724A61976BEA634B0804983227B155CE5646D69046A0CFB7C0908B9
        FF00CDB3FADFC0A6C5BAAAE9687B83492481F3494C2ACBBDD6B5AE2082608885
        6A8FE6CFF5DFFF0054E545A41CB041906C905586BEC6821BF4439C498E3DEFE5
        2527AFE8FCCFE52A6A15FD1F9BBF2953494A4924925292492494FF00FFD6F554
        924925292492494D47CC90013BF73749D75B3428F47D03FD77FF00D5B902C0EE
        786CBA1DD81DCE50B6DB2B63763B6CBED9E0F0F3E2929267FF0036CFEB7F02AB
        16B3D3639CF2D26406813C13AF2116F739F8B539C64976A7FCE407FD0AFE07FE
        A8A4A4940ABD667B9C4CE836C6BFE71461CC6B1B9DBE22237BF6EE90A18C318D
        8C8DE2CE44F130A40804FBA0973A1BD9FEF7FB5C929B55FD1F9BBF295251AFE8
        FCDDF94A924A5249249294924924A7FFD7F554924925292492494D5B047BE3E8
        974900C81B8EE87A0E4FD167F5EDFF00AB57185A184BB8971FFA4509A6B2C2CB
        185E0B9CE0434B8104973488FEB24A6A3AD73AA6D440861907BA90348AD82C6B
        9C7DD0418D372B1B317FD0BBFCC72773719D1353BDA20435DC7C92535B1BFA4B
        3C24C7DCE576868DA4C6A5CE13F07BE10D831EB76E656E07C76B8A2D12190ED1
        C4B9DB6751B89747E29297AFE8FCCFE52A6A15FD1F99FCA54D25292492494A49
        249253FFD0F55492492529249249481F58261C0E85C5A409FA5FF914DE9553C3
        BFCD2AC2492906C61631AE06590010D3C0FF007255B58C7120182002369EC8E9
        24A6A8A6B9D5A768FA3A12636ECDAE90A4DAD8C735CC6BA469111A6BFD9FCE56
        12494C58D2D68079E4FC4EAA49249294924924A524924929FFD9FFE201A84943
        435F50524F46494C450001010000019841444245021000006D6E747247524159
        58595A2007CF00060003000000000000616373704150504C000000006E6F6E65
        000000000000000000000000000000010000F6D6000100000000D32D41444245
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000563707274000000C00000003264657363
        000000F400000069777470740000016000000014626B70740000017400000014
        6B545243000001880000000E7465787400000000436F70797269676874203139
        39392041646F62652053797374656D7320496E636F72706F7261746564000000
        64657363000000000000000F477261792047616D6D6120322E32000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000058595A20000000000000F35400010000000116CF
        58595A2000000000000000000000000000000000637572760000000000000001
        02330000FFDB004300080606070605080707070909080A0C140D0C0B0B0C1912
        130F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F27
        393D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C2132323232
        3232323232323232323232323232323232323232323232323232323232323232
        3232323232323232323232323232FFC0001108036D026C030122000211010311
        01FFC4001F000001050101010101010000000000000000010203040506070809
        0A0BFFC400B5100002010303020403050504040000017D010203000411051221
        31410613516107227114328191A1082342B1C11552D1F02433627282090A1617
        18191A25262728292A3435363738393A434445464748494A535455565758595A
        636465666768696A737475767778797A838485868788898A9293949596979899
        9AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5
        D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F010003
        0101010101010101010000000000000102030405060708090A0BFFC400B51100
        0201020404030407050404000102770001020311040521310612415107617113
        22328108144291A1B1C109233352F0156272D10A162434E125F11718191A2627
        28292A35363738393A434445464748494A535455565758595A63646566676869
        6A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6
        A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2
        E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7
        FA28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
        0AA9737B1DBB0400C929E91AF5A75E5C7D9A0CA8DD231DA8BEA4D36CED05BA97
        63BA67E5DCFF002A008836A52F212188760C4934BB353FF9EB6FF91ABA480324
        F029B1C8B2C6AE872AC322802A6CD4FF00E7ADBFE468D9A9FF00CF5B7FC8D5FA
        280286CD4FFE7ADBFE468D9A9FFCF5B7FC8D5FA280286CD4FF00E7ADBFE468D9
        A9FF00CF5B7FC8D5FA280286CD4FFE7ADBFE468D9A9FFCF5B7FC8D5B92548977
        48E157A649A62DE5B31C09E3FF00BE850057D9A9FF00CF5B7FC8D1B353FF009E
        B6FF0091AB8CEA885D98050324934AAC1D4329054F423BD0052D9A9FFCF5B7FC
        8D1B353FF9EB6FF91AB8D2A23AA3380CDF7413D6A392EA089F6C92A2B7A13401
        5F66A7FF003D6DFF002346CD4FFE7ADBFE46ADC724728CC6EAC07F74E6869111
        9519C066FBA09EB4015366A7FF003D6DFF002346CD4FFE7ADBFE46AFD4624432
        98C30DE392B9E450054D9A9FFCF5B7FC8D1B353FF9EB6FF91ABA5828CB1000EA
        4F6AAC751B407699D334011ECD4FFE7ADBFE468D9A9FFCF5B7FC8D5C57575DC8
        C197B1078A7D0050D9A9FF00CF5B7FC8D1B353FF009EB6FF0091ABF450050D9A
        9FFCF5B7FC8D1B353FF9EB6FF91ABF450050D9A9FF00CF5B7FC8D1B353FF009E
        B6FF0091ABF450050DBA9AF3BEDDBDB079A12FDE39163BB88C2C4F0D9CA9FC6A
        DC522CD18910E5493CD124493214914329EA0D003C1CF2296B3AD5DEDAE0D948
        772E3744C7A91E95A34005145140051451400514514005145140051451400514
        5140051451400514514005145140051451400514514005145140051451400514
        5140051451400514514005145140051451400514514005145140051451400514
        514019E479FAC053F7604CE3FDA356A6B88ADD434ADB549EB826AAD8F3797C7F
        E9A0157994329560083D411D680336F353B76B491619773B0C0183DEA2D33508
        22B4114D26D2A4E383D2A9EA56F15B5D6C889C1192BFDDA86CE149EED22918AA
        B1EDFCA803A482EA1B8DDE53EEC75C0353D471C6912048D42A8E805494005145
        1400514514019DACFF00C790FF00AE82A46D32CD971E401EE2A3D67FE3C463FE
        7A0A66DD59FE52F1267B8A008232EB617D6ECDB96138526B4B4FFF008F087FDD
        AAB25A0B4D2675CEE761966F5356AC3FE3C20FF7450056BEFF0090958FFBC698
        618E7D6A659503288C100FE14FBEFF0090958FFBC6A1921926D66558A6311F2C
        12C07D38A002EA08ECAEEDA4B752859F69507A8A9EFF00FE42163FEF9FE95566
        827B19D2EE47FB42A9C12DD4558BD60D7B60C3A16C8FD28034EB3A1FF90E5CFF
        00D735FE95A359B1E4EB574075F2863F4A008B0DAA5D3A9622D6238C0FE23578
        58DA84DBE4478FA7F5AABA311F6375FE2121CD69D0066AD9CB69721ED39898E1
        E327A7D2B4A8A2800A28A2800A28A280229A68E04DF21DABEB826A9DC6A96C2D
        E4F2A5DD260ED001EB57C80C307906B9ED56DA1B7997CAC82E3257B0A009F4AB
        E86081A399F6E1B2B904E6B521BC82E18AC4FB88EBC1E2B9AB78D25B98E39090
        ACD82457510C31DBC612350AA2802AEA6A45BADC2FDF858303EDDEAEAB074561
        D08C8A8AF14359CC0FF70FF2A6D8B16B2849FEE0A00B34514500145145001451
        4500145145001451450014514500145145001451450014514500145145001451
        4500145145001451450014514500145145001451450014514500145145001451
        450014514500145145001451450050B0FF008FABEFFAEB57EA8587FC7D5F7FD7
        5ABF401416C15EEDEE2E30EC4FCABD9476A5BAD3926713444473A9C86EC7EB57
        A8A006F38E78A7514500145579EEE0B6FF005B20527A0EE6ABFF006CDA7F79FF
        00EF9A00D0A2B3FF00B66D3FBCFF00F7CD1FDB369FDE7FFBE680135804D92E07
        F18E95A359FF00DB369FDE7FFBE68FED9B4FEF3FFDF34016E78FCE8248CFF129
        159B6B7E2CE316D748E8F1F00819C8A9FF00B66D3FBCFF00F7CD21D5ECD86096
        3F55A008A2637FA8A5C2A32C110C296E326925B85B5D5E591D5CA98C01B467D2
        A7FED9B4FEF3FF00DF347F6CDA7F79FF00EF9A00AF7170FA8A7D9EDE1902B11B
        9DC60014ED448B79EC9B0C563273819E062A6FED9B4FEF3FFDF347F6CDA7F79F
        FEF9A00135681DD54473658E395A4873FDB7727071E58FE94BFDB369FDE7FF00
        BE68FED9B4FEF3FF00DF34011CD14D6574D736E9BE27E648C7F3A7FF006CDB63
        91286F4DB4BFDB369FDE7FFBE693FB5ECF39CB67D76D003627BABDB85930D05B
        AF206797AD3ACFFED9B4FEF3FF00DF347F6CDA7F79FF00EF9A00D0A2B3FF00B6
        6D3FBCFF00F7CD1FDB369FDE7FFBE6803428AA31EA969236DF33693D370C55D0
        723228016A81B0596F1AE27F9B1C2276C0F5ABF450051BBD3E2B91BD7E4957A3
        0FEB56D776D1BB1BB1CE3D69F45004575FF1E937FD736FE551E9FF00F20F83FD
        C1525D7FC7A4DFF5CDBF9547A7FF00C83E0FF72802CD14514005145140051451
        4005145140051451400514514005145140051451400514514005145140051451
        4005145140051451400514514005145140051451400514514005145140051451
        40051451400514514005145140142C3FE3EAFBFEBAD5FAA161FF001F57DFF5D6
        AFD0014514500155AF2E05ADBB4B8E47007A9AB3591AEB1F2E140782493FE7F1
        A0086C2C3ED99B9B925831E067EF568FF65D97FCF01F99A9E0411C11A0006D50
        2A5A00A7FD9765FF003C07E668FECBB2FF009E03F335728A00A7FD9765FF003C
        07E668FECBB2FF009E03F33FE35728A00A7FD9765FF3C07E668FECBB2FF9E03F
        335728A00A7FD9765FF3C07E668FECBB2FF9E03F33FE35728A00A7FD9765FF00
        3C07E668FECBB2FF009E03F335728A00A7FD9765FF003C07E668FECBB2FF009E
        03F335728A00A7FD9765FF003C07E668FECBB2FF009E03F335728A00A7FD9765
        FF003C07E668FECBB2FF009E03F335728A00A7FD9765FF003C07E668FECBB2FF
        009E03F335728A00CD9F48B79108897CB6EC41FE750E9570E92359CDF7973B73
        EDD456C5625D8F275C85C1C6E2A4E3F23401B74514500145141E940115D7FC7A
        4DFF005CDBF9547A7FFC83E0FF007054975FF1E937FD736FE551E9FF00F20F83
        FDCA00B345145001451450014514500145145001451450014514500145145001
        4514500145145001451450014514500145145001451450014514500145145001
        451450014514500145145001451450014514500145145001451450050B0FF8FA
        BEFF00AEB57EA8587FC7D5F7FD75ABF4005149919C679F4A5A002B1B5DEB6FFF
        0002FE95B358DAEF5B7FAB7F4A00D85FBA3E94B48BF747D296800A28A2800A28
        A2800AAB7577F662A3616DDEF8AB5599AAFDF8BE86801DFDAA3FE78FFE3D47F6
        A8FF009E3FF8F566D1F8D00697F6A0FF009E27FEFAAB11DD892D9A6DA46DCE45
        62D685BFFC82E6FA9FE42801DFDABFF4C7FF001EFF00EB51FDAA3FE78FFE3DFF
        00D6ACDA33401A5FDA83FE789FFBEA8FED51FF003C7FF1EACDA28034BFB547FC
        F1FF00C7BFFAD47F6A8FF9E3FF008F566F6A2803486A8B9E62207B355C8A78E6
        5DC8D9F51E9583562C9D96E9003F78E0D006DD62EA7FF216B6FF0080FF003ADA
        AC4D4FFE42D6FF0045FE7401B745145001451487A5004775FF001E937FD736FE
        551E9FFF0020F83FDC1525D7FC7A4DFF005CDBF9547A7FFC7841FEE0A00B3451
        4500145145001451450014514500145145001451450014514500145145001451
        4500145145001451450014514500145145001451450014514500145145001451
        4500145145001451450014514500145145001451450050B0FF008FABEFFAEB46
        A33C91AC714276C9336D0DE94587FC7D5F7FD75A8B537F2EE2CE421884724E06
        7D28003A345B38964F37FBE4F7FA54306A53F95E408CCB7218AE7B63D4D59FED
        883FE794FF00F7C5471EA3690E7CB8265DC727E4EBFAD0058B4B69D2469EE252
        F2B0C60745154F5DEB6FFF0002FE957ADAFE2BA90A2248A40C9DCB8AA3AEF5B7
        FAB7F4A00D85FBA3E94B48BF747D296800A28A2800A28A2800ACCD57EFC7F435
        A7599AAFDF8BE868033E8A28A002B42DFF00E41737D4FF002159FC5685A82DA6
        CC00C924E00FA0A00CFA28A2800A28A2800FC68C51450015359FFC7DC5F5A87F
        0A9ACFFE3EE2FF007A80376B1353FF0090B5BFD17F9D6DD626A7FF00216B7FA2
        FF003A00DBA28A2800A4A5A0D004575FF1E937FD736FE551E9FF00F20F83FDC1
        525D7FC7A4DFF5CDBF9547A7FF00C83E0FF7050059A28A2800A28A2800A28A28
        00A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28
        00A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28
        00A28A2800A28A2800A28A28028587FC7D5F7FD75A9AE9EE502FD9A257CE776E
        38C54361FF001F57DFF5D6AFD006779DAA7FCFAC5FF7DFFF005E90DC6A6A326D
        23207A373FCEB4A8A00A7697AB72594A18E55FBC8DDAA96BBD6DFF00E05FD2A5
        89D65D6E478882AB1E188E84D45AEF5B7FF817F4A00D85FBA3E94B48BF747D29
        6800A28A2800A28A2800ACCD57EFC5F435A7599AAFDF8FE868033E8A28CD0015
        ADA67FC7AB7FBE7F90AC9AD6D33FE3D5BFDF3FC85005830C47931A73FEC8A5F2
        22FF009E49FF007C8A928A008FC88BFE7927FDF228F222FF009E49FF007C8A92
        8A00E70FDE3F5A295BEF1FAD250015359FFC7DC5FEF5435359FF00C7DC5F5A00
        DDAC4D4FFE42D6FF0045FE75B7589A9FFC85ADFE8BFCE8036E8A8A7992DE2696
        4385155ED2EE5B9724C0638B6E5589E4D005DA2A95D5F2DB3AC6A8D24ADD1569
        2DF5059A6F2648DE197B2B77A00B375FF1E937FD736FE551E9FF00F20F83FDC1
        525D7FC7A4DFF5CDBF9547A7FF00C83E0FF7050059A28A2800A28A2800A28A28
        00A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28
        00A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28
        00A28A2800A28A2800A28A28028587FC7D5F7FD75A92F2DA3B855324AD1AA679
        0D8FCEA3B0FF008FABEFFAEB4CD50191ED602484924F9B14015162D3D9F68BE9
        73EE7FAE2ADFF63C5DE69C8FF7AA796C6DDEDDA310A0E30081C8FC6A3D2A4692
        C1371C9525726802C5BDAC56C9B225C67A9EE6B375DEB6FF0056FE95B358DAEF
        5B7FAB7F4A00D85FBA3E94B48BF747D296800A28A2800A28A2800ACCD57EFC7F
        435A7599AAFDF8BE868033E8A28A002B5B4CFF008F56FF007CFF00215935ADA6
        7FC7AB7FBE7F90A00BB4514500145145007387EF1FAD141FBC7EB450015359FF
        00C7E47FEF5435359FFC7DC5FEF5006ED626A7FF00216B7FA2FF003ADBAC4D4F
        FE42D6FF0045FE740173568DE4B1F94676B0623DA9E9A85AB4024F355401CAE7
        91F855BAC6B87B692E192DAC966907561C28A009B4E06E2E26BC718DC76A67D2
        9B3CD1DDEA16CB01DE636DCEC07414EFB4DFDBA82F669E58ED19E9566CA5B79A
        22D6EAABCFCCA00041F7A009AEBFE3D26FFAE6DFCAA3D3FF00E41F07FB82A4BA
        FF008F49BFEB9B7F2A8F4FFF008F083FDC1401668A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A00A161FF1F57DFF005D69D7D692DCB42D148A8D1924
        1229B61FF1F57DFF005D6A4BEB936D06E519918ED41EA6802B3C3A822E5EFA35
        1EE3151DBDA5DC71ECB7BD8B6E738519A923D2C4A7CCBC91E490F246781ED4E7
        D2211F35BB3C520FBA41A009AD61BB8E463713AC8A47000C7354B5DEB6FF00F0
        2FE9572C2E5E5124537FAE88E1BDFDEA9EBBD6DFFE05FD2803617EE8FA52D22F
        DD1F4A5A0028A28A0028A28A002B3355FBF17D0D69D666ABF7E2FA1A00CFA28A
        2800AD5D3485B46278018E4FE02B2AAEC448D266C7F7BFC2802EFF00685B7FCF
        4FD0D1F6FB6FF9E9FA1AC5A28036BFB42DBFE7A7E869A6FEDB19DFFA1AC7A280
        03C927DE8145140054D67FF1F717FBD50D4D67FF001F717FBD401BB589A9FF00
        C85ADFE8BFCEB6EB1353FF0090B5BFD17F9D005DD52568AC9B69C339080FA66A
        7B6B75B6816241D3A9F5350EA70B4D64DB7EF290C07D2A4B4B94BA815D4FCD8F
        987A1A00B1599709F66D520963E04CDB1C0EFEF5A7597238BDD4E1488E5203B9
        9BDE80342EBFE3D26FFAE6DFCAA3D3FF00E41F07FB82A4BAFF008F49BFEB9B7F
        2A8F4FFF00907C1FEE0A00B34514500145145001451450014514500145145001
        4514500145145001451450014514500145145001451450014514500145145001
        4514500145145001451450014514500145145001451450014514500145145001
        451450050B0FF8FABEFF00AEB4DD439BCB11FF004D0FF4A7587FC7D5F7FD75A7
        DE5A477263DF2942A4EDC1C66802E5159874950326E6603FDEA06948C32B7531
        1EA1A801D0FF00C872E3DE31FD2ABEBBD6DFEADFD2ADDAD9476D3B30999DCAE0
        863DAAA6BBD6DFEADFD2803617EE8FA52D22FDD1F4A5A0028A28A0028A28A002
        B3355FBF1FD0D69D666ABF7E3FA1A00CFA28A3AD00157A2FF904CDFEFF00F855
        1ABD17FC8266FF007FFC28028D145140051451DE800A28A2800A9ACFFE3EE2FF
        007AA1AB5610B3DC07FE14EA680366B1353FF90B5BFD17F9D6DD62EA7FF216B6
        FF0080FF003A00D49E78EDE3F324385E9D2A8C77DA742F23C6C54C98DD8535A4
        CAAC30C011E869BE4C5FF3C93FEF9140150EAD678C7987FEF9351D9DD58C6560
        818E58F70793F5A4D3A3469AF01453894E323A56808A352088D011DC0A004BAF
        F8F49BFEB9B7F2A8F4FF00F907C1FEE0A92EBFE3D26FFAE6DFCAA3D3FF00E41F
        07FB82802CD14514005145140051451400514514005145140051451400514514
        0051451400514514005145140051451400514514005145140051451400514514
        005145140051451400514514005145140051451400514514005145140142C3FE
        3EAFBFEBAD3750FF008FDB1FFAE87FA53AC3FE3EAFBFEBAD3AFAD25B9685E291
        51A3248245004F75FF001E937FD736FE550E97FF0020D87E87F99AAED67A8B29
        56BB4218608DB491D8DFC31AC71DDA2AAF41B6802487FE43B71FF5C87F4AAFAE
        F5B7FF00817F4AB569673C374F3CF2AC85976F02AAEBBD6DFEADFD2803617EE8
        FA52D3140E1B1CE319A7D0014514500145145001599AAFDF8FE86B4EB3355FBF
        1FD0D0067D1DA9296800AD3B18C4B62E8DD0B1FE42B32B5B4CFF008F56FF007C
        FF00214015CE992678917F1A3FB2E5FF009E895A32CAB1465DCE00ACE6D51F71
        DB1AEDED9A003FB2E5FF009E8947F65CBFF3D13F5A3FB525FF009E69FAD1FDA9
        2FFCF34FD6800FECB97FE7A251FD972FFCF44A3FB526FF009E69FAD1FDA92FF7
        13F5A00069726E1991719E715A4A8B1A85450147402B37FB525FF9E69FAD4F69
        7AD3CA51D40E32314017AB1353FF0090B5BFD17F9D6DD626A7FF00216B7FA2FF
        003A00D5B99248A2DD1C4646C8F94553FB75E7FD03DFF3ABEEEB1A33B9C28192
        4F6ACC125E6A0DBA16F22DF380D8F99A8023B696F2DDE66FB13B79ADBBAF4AB7
        15E5D3CAAAF64C8A4F2C4F4A8DAC6F106E8AF9D98767E86A5B3BC695DA09D365
        C2751FDE1EA2802CDD7FC7A4DFF5CDBF9547A7FF00C7841FEE0A92EBFE3D26FF
        00AE6DFCAA3D3FFE41F07FB82802CD1451400514514005145140051451400514
        5140051451400514514005145140051451400514514005145140051451400514
        5140051451400514514005145140051451400514514005145140051451400514
        514005145140142C3FE3EAFBFEBAD4B77686EB6E2678F6E7EEF7A8AC3FE3EAFB
        FEBAD5A9278A1C79922A67A6E34019D2E9AD1C2EFF006B98ED52719EB8A65AD8
        3DC5AC729BA954B0CE01AB971776CD6D2AACE8494200DDD78A8B4FBAB78EC215
        7991580E413D39A009AD6C8DB485CCF249918C376AA5AEFF00CBBFD5BFA569C7
        710CC711CAACC06700D666BBD6DFEADFD2803595470DDF18CD3E917EE8FA52D0
        014514500145145001599AAFDF8FE86B4EB3355FBF1FD0D0067D145140056B69
        9FF1EADFEF9FE42B26B4ACFF00E41B37FC0BF950054BBB833CC79F901C28A828
        A39A0028A4A5A0028A28A003156F4DFF008FAFF809AA956F4DFF008FAFF809A0
        0D8AC4D4FF00E42D6FF45FE75B758BA9FF00C85ADBFE03FCE802D6B048B20012
        033807E95763458E3545185518150DE5B8BAB668B2037507D0F6AAF697EB8F22
        E4F953270771EBEF9A00D1ACDBF01350B3917862FB0FB8AB6F75046859A6403F
        DEAA3096D42F96E0A91045F733FC47D680342EBFE3D26FFAE6DFCAA3D3FF00E4
        1F07FB82A4BAFF008F49BFEB9B7F2A8F4FFF00907C1FEE0A00B3451450014514
        5001451450014514500145145001451450014514500145145001451450014514
        5001451450014514500145145001451450014514500145145001451450014514
        5001451450014514500145145001451450050B0FF8FABEFF00AEB525E8B5F2C3
        DD052ABD33FD2A3B0FF8FABEFF00AEB516A585BAB5797FD48621B23807DE8024
        B7B5B0B887CD4B70173FC43154DE6D3B7958ECDA400F2CA38AB7A85E46B68C91
        48AD24836A8539EB562D2DC5ADB24606081F37B9A008AC459B8696D902B7423B
        8AA9AEF5B7FAB7F4A92DD95B5A99A120A6CF9C8E84D47AEF5B7FF817F4A00D85
        FBA3E9505CDD2DB052CA4EEF4A9D7EE8FA567EABD22FA9A0077F6A47FF003CDB
        F3147F6AC7FF003CDAB2E8A00D4FED48FF00E79B7E62A7B6B95B90C5548C1EF5
        895A5A57DC93EA280346B3355FBF1FD0D69D666ABF7E3FA1A00CFA28A2800AD2
        B3FF00906CDFF02FE559B5A567FF0020D9BFE05FCA8033451476A2800A292A6B
        687CF9D53F87AB1F6A008A8ADB1656E38F287E34BF63B7FF009E4B4018756F4D
        19BAFF00809AD1FB241FF3C969E91244308A17E828024AC4D4FF00E42D6FF45F
        E75B7589A9FF00C85ADFE8BFCE80368D65DE5CDB4D2794B6E6E645FEEF6FC6AC
        6A7334166C538662141F4CD49696C96900451F37F11F5340190B1A41F3CDA63E
        D1DF7138AD8B69E1B8883424151C63D3DAA7ACB923165A9C2F1711CE76B2FBFA
        D00685D7FC7A4DFF005CDBF9547A7FFC83E0FF007054975FF1E937FD736FE551
        E9FF00F1E107FB82802CD1451400514514005145140051451400514514005145
        1400514514005145140051451400514514005145140051451400514514005145
        1400514514005145140051451400514514005145140051451400514514005145
        140142C3FE3EAFBFEBAD3EF6E2DE18D56E14B2BE70319A6587FC7D5F7FD75AB1
        716B15D28595738E841E4500664571A5C326F485C30E84A938A92E350B2B98FC
        B7F382E73C2D49F65BCB6FF8F69C4883FE59C9FE34ABA908D825DC2D0B7A9190
        6800D3E5B4398AD9197032723AD57D77ADBFFC0BFA56AC7224ABBA36565F506B
        2B5DEB6FFF0002FE9401B0BF747D2B3F55E917E3FD2B417EE8FA567EABF762FA
        9FE94019B451450015A7A57DC93EA2B32B4F4AFB927D4500685666ABF7E2FA1A
        D3ACCD57EFC7F434019F45147E140056959FFC8366FF00817F2ACDAD2B3FF906
        CDFF0002FE54019B45276A5A002A6B59BC89D5CE76F438A868FC280379678994
        112260FBD289233C0917F3AE7E96803A207238A5AE7925789B723953ED5B36B7
        02E22DC7861C30A00B1589A9FF00C85ADFE8BFCEB6EB1353FF0090B5BFD17F9D
        005DD522696C9B6FDE421F1EB8A9EDA75B9816442391C8F4352332A8CB1007A9
        359B2DAC6B2B4B6974B0B1EA3770680356B32E1BED3AADBC29C884EF73E9ED51
        B25E4A3649A842AA7AECC66ADDA476D6C82389D4B13C9DC32C68027BAFF8F49B
        FEB9B7F2A8F4FF00F907C1FEE54975FF001E937FD736FE551E9FFF0020F83FDC
        A00B345145001451450014514500145145001451450014514500145145001451
        4500145145001451450014514500145145001451450014514500145145001451
        450014514500145145001451450014514500145145001451450050B0FF008FAB
        EFFAEB57EA8587FC7D5F7FD75A3528AEA5545B6240E77E1B19FF003CD004D3DE
        5BDB7FAC9067FBA393555AE2EAF06D82D82C67F8E51FD2A082D6EEDCE52CA12D
        FDE66C9FE7567CED53FE7DA1FF00BEBFFAF400EB1D3C5A33399373B0C100600A
        ABAEF5B7FF00817F4ABD6D25E34845C451A2E32369C926A8EBBD6DFEADFD2803
        617EE8FA567EABF762FA9FE95A0BF747D2B3F55E917E3FD2803368A28EF40056
        9E95F724FA8ACCED5A5A57DC93EA280346B3355FBF1FD0D69D666ABF7E2FA1A0
        0CFA28A2800FA56959FF00C8366FF817F2ACDAD3B152F61228EE48FD28033051
        410558823041C114500145145001451450015A5A57497F0FEB59B5A5A57497F0
        FEB401A358BA9FFC85ADBFE03FCEB6AB1353FF0090B5BFD17F9D005BD63FE41E
        DFEF0A44D26CDA356319C900FDEAB7736E9751795212149CF06A451B5401D862
        80297F63D9FF00CF33FF007D1A747A65AC52AC89190CA723E635768A008AEBFE
        3D26FF00AE6DFCAA3D3FFE41F07FB82A4BAFF8F49BFEB9B7F2A8F4FF00F907C1
        FEE50059A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28028587FC7D
        5F7FD75ABA4E07A01EB54AC3FE3EAFBFEBAD1A8DA4B751A08D80DA492A4901A8
        0166D4EDE13B43798FD9539AADF6ABDBAB8F21145BFCBB8EEEB8A586E52C7E49
        ACCC1FEDA8C83F8D3A19526D64BC6C194C5D450058B4B216F2348D2BC9230C16
        6354B5DEB6FF00F02FE95B358DAEF5B7FAB7F4A00D85FBA3E959FAAFDD8BEA7F
        A5682FDD1F4ACFD57EEC5F53FD2803368FC68A2800AD3D2BEE49F515994E495E
        31F23B2E7AE0D00743593A9B869D541FBABCD56FB4CFFF003DA4FF00BE8D4649
        3C9A0028A28A002B5B4CFF008F56FF007CFF00215935ADA67FC7AB7FBE7F90A0
        074F6314CC5F2558F522A0FECA1DA6FF00C76AEF9F103CCA9FF7D0A5FB443FF3
        D63FFBE850051FECAFFA6DFF008ED54B8B67B72371041E8456CFDA21FF009EB1
        FF00DF42A86A33C6F1AA23063BB271CD0067F3476A28A002B4B4AE92FD47F5AC
        DAD2D2BA4BF87F5A00D1AC5D4FFE42D6DFF01FE75B5589A9FF00C85ADFE8BFCE
        8036E8A28A0028A28A008AEBFE3D26FF00AE6DFCAA3D3FFE41F07FB9525D7FC7
        A4DFF5CDBF9547A7FF00C7841FEE0A00B3451450014514500145145001451450
        0145145001451450014514500145145001451450014514500145145001451450
        0145145001451450014514500145145001451450014514500145145001451450
        0145145001451450050B0FF8FABEFF00AEB5666B88A0C79B22A67A67BD56B0FF
        008FABEFFAEB5665B78A7C79A8AF8E99ED40111BEB361833C641EA0D53963D36
        46DD1CEB0C9FDE438ABDFD9F69FF003C13F2A4FECEB43FF2EE94011D9ADC8622
        49D26871F2B8EB9F7AA9AEF5B7FF00817F4A92D545B6AD25BC39F2CA6E2B9FBA
        6A3D77FE5DFEADFD2803617EE8FA567EABD22FC7FA5682FDD1F4ACFD501D919C
        7009C9A00CDA28A4A005A28A39A0028A28A0028A28A003BD69599C69D363FDAF
        E559B5A567FF0020D9BFE05FCA803368E28A0500252D19A28012978A28A002B4
        B4AE92FE1FD6B36B4B4AE92FE1FD680346B1353FF90B5BFD17F9D6DD626A7FF2
        16B7FA2FF3A00DA14B4514005145140115D7FC7A4DFF005CDBF9547A7FFC83E0
        FF007054975FF1E937FD736FE551E9FF00F20F83FDC1401668A28A0028A28A00
        28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00
        28A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00
        28A28A0028A28A0028A28A0028A28A00A161FF001F57DFF5D6AFD50B0FF8FABE
        FF00AEB57E800A8E68CC90B2072848FBC3A8A928A00A969651DA02549676FBCE
        DD4D51D77ADBFD5BFA56CD636BBD6DFEADFD2803617EE8FA5473C2B3C451B8F4
        23B1A917EE8FA52D0073F342F0BEC71F43EB4CAE81D1645DACA187A1AAADA6C0
        4E72E3D81A00C9A2B5BFB320FEF49F98FF000A3FB320FEF49F98FF000A00C9A2
        B5BFB320FEF49F98FF000A3FB320FEF49F98FF000A00C9A2B5BFB320FEF49F98
        FF000A3FB320FEF49F98FF000A00C9552CC1546493802B68C421B1741D90E4FA
        9C510DA4501CA825BD4D4ECA1D4A9E84608A00E77B52D5F6D30EE3B6418ED914
        7F65C9FF003D17F2A00A1CD157FF00B2E4FF009E8BF951FD9727FCF45FCA8028
        77A2AFFF0065C9FF003D17F2A3FB2E4FF9E8BF950050AD5D3A168E266618DE78
        07D28B7D3D236DF21DEC3A0EC2AF5001589A9FFC85ADFE8BFCEB6EB1353FF90B
        5BFD17F9D006DD14514005145140115D7FC7A4DFF5CDBF9547A7FF00C83E0FF7
        054975FF001E937FD736FE551E9FFF0020F83FDCA00B34514500145145001451
        4500145145001451450014514500145145001451450014514500145145001451
        4500145145001451450014514500145145001451450014514500145145001451
        450014514500145145001451450050B0FF008FABEFFAEB57EA8587FC7D5F7FD7
        5ABF400514514005636BBFF2EFF56FE95B3599ACC264B4120C931B67F0A00D14
        394523D053AA969D702E2D139F9906D61576800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800AC5D479D5ED80EBF2
        FF003AD82428C93803A9AC484FDBB5A32AFF00AB43907D874A00DDA28A4CD002
        D14945004775FF001E937FD736FE551E9FFF0020F83FDC1525D7FC7A4DFF005C
        DBF9547A7FFC83E0FF007050059A28A2800A28A2800A28A2800A28A2800A28A2
        800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
        800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
        800A28A28028587FC7D5F7FD75ABF542C3FE3EAFBFEBAD5B9241144D21048519
        200E68024A2B3BFB62D89C059727A0DB47F6C5B7A4BFF7CD004D717F05B49B1C
        B16C648519C7D6A6478E7883290E8C3F3ACD4D46CD2E6598094B498CFC9D314D
        8352B6865982AC8236219542F43DE801B269D75693196CD8953D81E47B7BD1E7
        EAFF00DC6FFBE055AFED9B6FEECBFF007C51FDB36DFDD97FEF8A00ABE7EB1FDC
        6FFBE051E7EB1FDC6FFBE055A1ACDB7A4BFF007CD1FDB36BE92FFDF340157CFD
        63FB8DFF007C0A3CFD63FB8DFF007C0AB5FDB16A481893FEF9AD004119078A00
        C5F3F58FEE37FDF028F3F58FEE37FDF02B5A6956189A46048519200E6A9FF6CD
        AFA4BFF7CD0055F3F58FEE37FDF028F3F58FEE37FDF02AD7F6CDAE7A49FF007C
        D1FDB36BE92FFDF340157CFD63FB8DFF007C0A3CFD63FB8DFF007C0AB5FDB36D
        FDD97FEF9A3FB66DBD25FF00BE6802AF9FAC7F71BFEF81479FAC7F71BFEF8157
        21D52DE595635DE198E0656AFD006279FAC7F71BFEF81479FAC7F71BFEF815B7
        54E2D460965D8BBB96DA18AF04FA0340143CFD63FB8DFF007C0A3CFD63FB8DFF
        007C0ABB36A70412B46EB26E5EBF2D33FB66D7D25FFBE6802AF9FAC7F71BFEF8
        1479FAC7F71BFEF8156BFB66DBD25FFBE68FED9B53DA5FFBE68029B47AADD8F2
        E4CAA1EB9C28AD2B2B35B38768E58F2CDEB50FF6CDAFA4BFF7CD1FDB36BD712E
        3FDDA00D1A2B3BFB66DBD25FFBE68FED9B6F497FEF9A00D1A2A9DB6A105D4852
        3DDB80CFCC315728022BAFF8F49BFEB9B7F2A8F4FF00F907C1FEE54975FF001E
        937FD736FE551E9FFF0020F83FDC1401668A28A0028A28A0028A28A0028A28A0
        028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
        028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
        028A28A0028A28A00CFB0FF8FABEFF00AEB5A159F6DFBBD52EE3FEFE1C568500
        67DC42EB7CB7710F336AED68F3C8F714CB093CDBDBA64044448383D4377A65ED
        94AAF2DC412B00C3E751D71DF1576CD614B54F23EE11907B9FAFBD005783FE43
        775FEE2FF21443FF0021CB8FFAE63FA5107FC86EEBFDC5FE9443FF0021CB8FFA
        E63FA50035AEAEA6BB923B544D911C317EE6946A134B37976F6D964FF5819B18
        3E94FE2C6EE491B88662096C7DD6F7F6356A28A28B7344AAA1CEE2477A00A7A4
        1C59C84F1FBC6CFB74A8EDE58C6AB74C6440A40C1DC3069FA480D69202320CAD
        C1FC284D26DD26762A1A36FBAA7F8680119D24D6E028C1879479073EB5A75942
        08ADF5A856240AA632481F8D6AD00159C9C6B9267BC5C67BF22B46A09EDA3B80
        37E430E8CA704500549083AEC3839FDD1CFEB4DD52EE2FB3CF6FBB1260718EBC
        8A6476C96BACC28858E6324963924F3566F2D04ACB32229963E4023861E94013
        C4C12D632C428083249C638AA5A54D125B481E4453E6B1E580AB48F0DFDBB291
        F29E194F506A08349B78D0895448776413C71E9400DB121B51BC2A41048C115A
        7597A7A2C7A85DA200AAA400076AD4A004EB589771359C4B0AC88633286033F3
        2FFF005AB72A95E69F15DBAB93B5C7520751E86801F733C4F6B32ACA85BCB6C0
        0C3D2A2B5FF9020FFAE4DFD6967B2B68ADE5748555846D823B714ED3803A6C20
        F42BCD0054B1F32DECA29D72F130FDE2771CF515368FFF001E6E7FE9A37F4A73
        69E71E525C4896F9FF005607E99A6E8D8166E07FCF43FD28023B0FF9075D7FBE
        FF00CAABC9FF0022FC1FEF0FE66B427B1F319CC733C5BFEF85E8D55F528560D2
        D224CED560066802E5EB2AD9CA1980CA1C64F5E2A2B09E25B18434A8085E4161
        52DD5AA5DC3B1F8EEA7D0D4316956C912AC912BB81CB73CD003746FF008F26FF
        00AE8D5A359DA37FC7937FD7435A340115D7FC7A4DFF005CDBF9547A7FFC83E0
        FF0070537517F2EC2539E4AED1F8D4D6E9E5DB4484636A014012D14514005145
        1400514514005145140051451400514514005145140051451400514514005145
        1400514514005145140051451400514514005145140051451400514514005145
        1400514514005145140051451400514514019F7E0C134378A3213E5703FBA6AF
        2B0650CA7208C83EB4328752AC3208C11EB59C3CED349015A5B5278C7DE4FF00
        EB50069D450C11C0ACB18C02C588F7351477F6B20C89D07B31C7F3A93ED56FFF
        003F117FDF62801C22412190280E4609F514794825F3428DE4609F514DFB55BF
        FCFC45FF007D8A3ED56FFF003F117FDF6280246019704641EC7BD36289214091
        AED51DA9BF6AB7FF009F88BFEFB147DAADFF00E7E22FFBEC500392348C30450B
        93938F5A92A1FB55BFFCFC45FF007D8A3ED56FFF003F117FDF62802A4D6B722E
        FED114AAD8FBA8E3F319AB504EB3A6402AC0E194F5534BF6AB7FF9F88BFEFB15
        1F9B6825320961DE4609DE3914016A8A87ED56FF00F3F117FDF628FB55BFFCFC
        45FF007D8A0071890C8B2151BD7807B8A92A1FB55BFF00CFC45FF7D8A3ED56FF
        00F3F117FDF62801CB12248EEAA033E3711DEA4A87ED56FF00F3F117FDF628FB
        55BFFCFC45FF007D8A00A6905D5ACAF36E13AB7DE18F9F1DAAF4722CA81D0E54
        8E0D37ED56FF00F3F117FDF6298B3DAA6EDB344371C9C38E4D0059A2A1FB55BF
        FCFC45FF007D8A3ED56FFF003F117FDF62802B6A4EE043107F2D656DAEFE82A2
        B7996D94A24A26B7438620731FF88AB724B692A149258594F505853637B28536
        47240ABDC061CD00580430C8C107A11491C691021142827271EB514735A44812
        39A2551D06F1C53FED56FF00F3F117FDF628026A8E48D654D8EA194F634DFB55
        BFFCFC45FF007D8A3ED56FFF003F117FDF628026A8E55692365562848E1876A6
        FDAADFFE7E22FF00BEC51F6AB7FF009F88BFEFB14014A113E9E3F7C55E16392E
        A31B4FA91E95A2082010720FA542D756D83BA78B1DFE606AA7DAB7A8B7D3D376
        38F308F956801D707ED77B1DB2F2919DF27F415A355AD6D96D62DA0966272EE7
        AB1AB34005145140051451400514514005145140051451400514514005145140
        0514514005145140051451400514514005145140051451400514514005145140
        0514514005145140051451400514514005145140051451400514514005145140
        103DA5BC872F0C64FAEDA6FF0067DA7FCFBA7E55668A00ADFD9F69FF003EE9F9
        51FD9F69FF003EE9F9559A2802B7F67DA7FCFBA7E547F67DA7FCFBA7E55668A0
        0ADFD9F69FF3EE9F951FD9F69FF3EE9F9559A2802B7F67DA7FCFBA7E547F67DA
        7FCFBA7E55668A00ADFD9F69FF003EE9F951FD9F69FF003EE9F9559A2802B7F6
        7DA7FCFBA7E547F67DA7FCFBA7E55668A00ADFD9F69FF3EE9F951FD9F69FF3EE
        9F9559A2802B7F67DA7FCFBA7E547F67DA7FCFBA7E55668A00ADFD9F69FF003E
        E9F951FD9F69FF003EE9F9559A2802B7F67DA7FCFBA7E547F67DA7FCFBA7E556
        68A00ADFD9F69FF3EE9F951FD9F69FF3EE9F9559A2802B7F67DA7FCFBA7E547F
        67DA7FCFBA7E55668A00ADFD9F69FF003EE9F951FD9F69FF003EE9F9559A2802
        B0B1B553916F1FE553AAAAA80A0003B0A7514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514554B8BD4B72100324A7A46BD4D005BA2B3C36A52F212188760C493
        4BB353FF009EB6FF0091A00BF4550D9A9FFCF5B7FC8D1B353FF9EB6FF91A00BF
        4550D9A9FF00CF5B7FC8D1B353FF009EB6FF0091A00BF4550D9A9FFCF5B7FC8D
        1B353FF9EB6FF91A00BF4550D9A9FF00CF5B7FC8D1B353FF009EB6FF0091A00B
        F4550D9A9FFCF5B7FC8D1B353FF9EB6FF91A00BF4550D9A9FF00CF5B7FC8D1B3
        53FF009EB6FF0091A00BF4550D9A9FFCF5B7FC8D1B353FF9EB6FF91A00BF4550
        D9A9FF00CF5B7FC8D1B353FF009EB6FF0091A00BF4550D9A9FFCF5B7FC8D1B35
        3FF9EB6FF91A00BF4550D9A9FF00CF5B7FC8D1B353FF009EB6FF0091A00BF455
        0D9A9FFCF5B7FC8D1B753FF9EB6FF91A00BF4550D9A9FF00CF5B7FC8D1B353FF
        009EB6FF0091A00BF4550D9A9FFCF5B7FC8D1B353FF9EB6FF91A00BF4550DBA9
        AF3BEDDB1DB079A16FDE39163BB88C2C4E0303953F8D005FA2901CF2296800A2
        8A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2
        8A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2
        8A2800A28A2800A28A2800A28A2800A28A2800A28A2802B5E5CFD9A0CA8DD231
        DA8BEA4D36CED45BAEF73BA67E5D8F7A888F3F5800FDD81338FF0068D5A9AE23
        B75DD2B6D527AE09A0090900649E0536391658D644395619159F79A95B9B4916
        19773B0C0001EF5169BA8410DA08E693695271C1E9401B3454105DC3739F29F7
        63A9C1A9E800A28A2800A28A280239254897748E157A649A62DE5B31C09E3FFB
        E8555D679B11FF005D0548DA659B2E3C803DC5005A675442EC40503249A5560E
        A19482A7A11DEB1A32EB617D6ECDB96138526B4AC3FE3C20FF00705004CD2A23
        AA3380CDF7413D6A392EA089F6BCA8AC3B13552FBFE42563FEF1A618239F5A99
        6540CA230403F850068C724728CC6EAC07F74E6869511D519C0663F283DEB2EE
        ADE3B3BBB592DD4A967DA541EA2A6BFF00F90858FF00BE7FA500695462543218
        C38DE072B9E454959D0FFC876E7FEB98FE94017CB051962001D49ED558EA3681
        B699D3354F0DAA5D3A9622D6238C0FE2357858DA84D8208F1F4FEB40132BABAE
        E460CBD883C53EB316CE5B4B90F6873131F9E363FCAB4E800A28A2800A28A280
        0A2A29A748137C876AFAE09AA771AA5B7D9E4F2A5CC9B4ED001EB40176291668
        C3A1CA9CE0D124692C651D4329EA08AC7D2AFA282068E670B86CAE4139CD6A43
        7905C31589F711D783C50057B567B6B836521DCB8DD131EA47A568550D4D48B7
        59D7EFC2C181F6EF57558322B0E8C322801D4514500145145001451450014514
        5001451450014514500145145001451450014514500145145001451450014514
        5001451450014514500145145001451450014514500145145001451450014514
        500145145001451450067D8F3797C7FE9A01579955D4860083D41EF54AC3FE3E
        AFBFEBAD5FA00E6B53B78ADAE76C59C1192BE950D9C293DDC71484AAB1EDFCAB
        712C03DD3DCDC61D89F957B01DA96EB4F495C4D1111CCA721BB1FAD005A8E348
        90246A1547402A4A6F38E78A75001451450014514500676B3FF1E23D7CC14CDB
        AB3E54BC499EE3B53F58C9B25C0CFEF074AD1A00CC92D05A6953AE773B0CB37A
        9AB561FF001E107FBA2A49E3F3A09233FC4A4566DADF8B3885B5D23A3C7C0206
        4114012DF7FC84ACBFDE351490C936B12AC7318888C12C07D38A744CD7FA8ADC
        04658221F296EE69B2DC2DAEB12C8EAE54C607CA33E94011CD04F633A5DCAE2E
        154E096EA2AC5EB06BDB060782D91FA5477172FA8A7D9EDE1902B11B9DC60014
        BA8116F3593618AC64E7033C0C5006B566C609D6AEB079F2863F4A72EAD03BAA
        88E6CB1C0CAD2439FEDBB93838F2C7F4A006E8C47D9197F8848722B4EB2A68A6
        B1BA6B8B74DF13F32463F9D49FDB36D8E5640DE9B6803468ACC89EEAF6E164C3
        C16EBC819E5EB4E800A28A2800A28A2801A464608C83EB5CF6AB6D0DB4CBE564
        6E192BD85747540D82CD78D713FCC07089D801EB401836D1A4B711C7212158E0
        915D4430C7046238D42A8AAD77A7C77237AFC928E8C3FAD5B5DDB46EC6EC738F
        5A008EF143594C0FF70FF2A6D8B16B1809FEE0A92EBFE3D26FFAE6DFCAA3D3FF
        00E41F07FB9401668A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00A
        161FF1F57DFF005D6AFD50B0FF008FABEFFAEB57E800A28A2800A28AAD79702D
        6D9A5EE3851EA680167BB82DBFD6C8149E83B9AAFF00DB369FDE7FFBE6A9D858
        7DB3373724B063C0CF5AD0FECBB2FF009E03F334011FF6CDA7F79FFEF9A3FB66
        D3FBCFFF007CD49FD9765FF3C07E668FECBB2FF9E03F33FE34011FF6CDA7F79F
        FEF9A3FB66D3FBCFFF007CD49FD9765FF3C07E668FECBB2FF9E03F33FE34011F
        F6CDA7F79FFEF9A43ABD93704B1FAAD4BFD9765FF3C07E668FECBB2FF9E03F33
        4011FF006C5A7ABFFDF347F6CDA7F79FFEF9A93FB2ECBFE780FCCD1FD9765FF3
        C07E67FC68023FED9B4FEF3FFDF347F6CDA7F79FFEF9A93FB2ECBFE780FCCD1F
        D9765FF3C07E668023FED9B4FEF3FF00DF347F6CDA7F79FF00EF9A93FB2ECBFE
        780FCCD1FD9765FF003C07E668023FED9B4FEF3FFDF349FDAF679CE5B3EBB6A5
        FECBB2FF009E03F3347F65D97FCF01F99A008FFB66D3FBCFFF007CD1FDB369FD
        E7FF00BE6A4FECBB2FF9E03F3347F65D97FCF01F99A008FF00B66D3FBCFF00F7
        CD1FDB369FDE7FFBE6A4FECBB2FF009E03F3347F65D97FCF01F99A0048F55B49
        1B6F99B49E9B862AE03919159F3E936F246444BE5BF6209A834AB87495ACE6CE
        E5CEDCF6C751401B14514500145145004575FF001E937FD736FE551E9FFF001E
        107FB82A4BAFF8F49BFEB9B7F2A8F4FF00F907C1FEE0A00B3451450014514500
        1451450014514500145145001451450014514500145145001451450014514500
        1451450014514500145145001451450014514500145145001451450014514500
        1451450014514500145145001451450050B0FF008FABEFFAEB57EA8587FC7D5F
        7FD75ABF40051451400563EBAC7CB8501E0B13FE7F3AD8AC6D77ADBFFC0BFA50
        06A4082382341818502A5A45FBA3E94B4005145140051451400514555BABBFB3
        151B376E1EB8A00B545677F6A0FF009E27FEFAA3FB547FCF1FFC7A803468ACEF
        ED51FF003C7FF1EAB11DD2C96CD36D236E7233401668ACEFED51FF003C7FF1EF
        FEB51FDAA3FE78FF00E3D401A345677F6A8FF9E3FF008F51FDAA3FE78FFE3DFF
        00D6A00D1A2B3BFB507FCF13FF007D51FDA83FE789FF00BEA803468ACE1AA0CF
        31103D9AAE453C73AE51B3EA3D28025AC4BB1E4EB90B838DE549C7E46B6EB135
        3FF90B5BFD17F9D006DD14514005145140115D7FC7A4DFF5CDBF9547A7FF00C8
        3E0FF72A4BAFF8F49BFEB9B7F2A8F4FF00F907C1FEE50059A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A28028587FC7D5F7FD75ABF542C3FE3EAFBFE
        BAD1A8CF2C6B1C309DB24CDB437A5005EC8CE33CFA52D659D1A2D9C4B279B8FB
        F9EF50C1A94FE57902332DC862BED8F53401B558DAEF5B7FF817F4AB9696D3A4
        8D3DCCBBA5618C0E8A3AD53D77FE5DFEADFD2803617EE8FA52D22FDD1F4A5A00
        28A28A0028A28A002B3355FBF1FD0D69D666ABF7E3FA1A00CFE28A28A002B42D
        FF00E41737D4FF002159F5A16FFF0020B9BEA7F90A00CEA5A28A0028A0D14001
        A33451400558B2765BA400FDEE0D57A9ACFF00E3EE2FF7A80376B1353FF90B5B
        FD17F9D6DD626A7FF216B7FA2FF3A00DBA28A2800A28A28022BAFF008F49BFEB
        9B7F2A8F4FFF008F083FDC1525D7FC7A4DFF005CDBF9547A7FFC83E0FF007050
        059A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
        800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
        800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28028587FC7D5F7FD
        75A8F537F2EE2CE4218AA392703E952587FC7D5F7FD75A9AE5EE536FD9A25933
        9DDB8E314015FF00B620FF009E53FF00DF151C5A95A420F9704CBB8E4E13AD49
        E76A9FF3EB17FDF5FF00D7A4371A928C9B48C81D8373FCE8027B6BE8AEA42889
        229033F32E2A8EBBD6DFEADFD2AF5A5EADC96528D1C89F791BB551D77ADBFD5B
        FA5006C2FDD1F4A5A45FBA3E94B4005145140051451400565EABF7E3FA1AD4AC
        CD57EFC7F434019F4519A2800AD0B604E9B30032493C0FA0ACFAD6D33FE3D5BF
        DF3FC850064FB515BC6188F2634FFBE452F9117FCF24FF00BE4500605276AE83
        C88BFE7927FDF228F222FF009E49FF007C8A00C0A283D4FD68A002A6B3FF008F
        B8BFDEA86A6B3FF8FB8BFDEA00DDAC4D4FFE42D6FF0045FE75B7589A9FFC85AD
        FE8BFCE8036E8A28A0028A28A008AEBFE3D26FFAE6DFCAA3D3FF00E41F07FB95
        25D7FC7A4DFF005CDBF9547A7FFC83E0FF007050059A28A2800A28A2800A28A2
        800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
        800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2
        800A28A2800A28A2800A28A28028587FC7D5F7FD75ABF542C3FE3EAFBFEBAD49
        796D1CEAA6495A354C9CAB63F3A00B745612C5A7B3ED17D2E7DDB8FCF1573FB1
        E2EF3CE47FBD400C89965D6E478882AB1E188EE6A2D77ADBFF00C0BFA5695BDB
        456D1EC8971EA7B9ACDD77ADBFD5BFA5006C2FDD1F4A5A45FBA3E94B40051451
        400514514005666ABF7E3FA1AD3ACCD57EFC7F434019F451450015ADA67FC7AB
        7FBE7F90AC9FC6B5B4CFF8F56FF7CFF21401768A28A0028A28A00E71BEF1FAD1
        437DE3F5A2800A9AD3FE3F22FF007AA1A9ACFF00E3EE2FF7A80376B1353FF90B
        5BFD17F9D6DD626A7FF216B7FA2FF3A00DACD2D54D42E5ADAD4BA01BC90AB9EC
        69B696B242DE6CD3BC9232E082781401733466B36E249EEAF8DADBC9E5AA0CBB
        8EBF4A457B8B2BB8A2965334529C0623906802F5CFFC79CDFF005CDBF95334FF
        00F907C1FEE0A92EBFE3D26FFAE6DFCAA3D3FF00E41F07FB82802CD145140051
        4514005145140051451400514514005145140051451400514514005145140051
        4514005145140051451400514514005145140051451400514514005145140051
        4514005145140051451400514514005145140142C3FE3EAFBFEBAD3354CC8F6D
        01242C927CD8A7D87FC7D5F7FD75A75F5ACB72F0BC522A34649048A0074D636E
        F6EC82141F2F040E47E351E952349609B8E4A92B9A89A1D4117E7BE8D47B8C54
        76F69771C7B2DEF62DB9CE146680362B1B5DEB6FFF0002FE9576DA2BB4918DC4
        EB22E38006306A96BBD6DFEADFD2803617EE8FA52D22FDD1F4A5A0028A28A002
        8A28A002B3355FBF1FD0D69D666ABF7E2FA1A00CEA5CD1CD140056B699FF001E
        ADFEF9FE42B26B574D216D189E00639FC85005EA2AAFF685B7FCF4FF00C74D2F
        F685B7FCF4FD0D0059A2AB7F685B7FCF4FD0D34DFDB819DE4FE068031DBEF1FA
        D141E493EF45001535A7FC7E45FEF5435359FF00C7DC5FEF5006ED626A7FF216
        B7FA2FF3ADBAC4D4FF00E42D6FF45FE7401A57B6DF6BB668F3B5BAA9F7AA7F6A
        BF8E3F2DACCB48060383C1AD19655862691CE15464D662C573A90F36495A180F
        DD45EA6802CE9D6AF6F1BBCA732C8D96F6A8D60B9BABA8E5B8558D2239555392
        4FBD21D1D546619E5471D0939A7DA5D4A27369758F3979561D1C5005BBAFF8F4
        9BFEB9B7F2A8F4FF00F907C1FEE0A7DD7FC79CDFF5CDBF95334FFF00907C1FEE
        0A00B34514500145145001451450014514500145145001451450014514500145
        1450014514500145145001451450014514500145145001451450014514500145
        1450014514500145145001451450014514500145145001451450050B0FF8FABE
        FF00AEB525F5C9B5832A33231DA83DEA3B0FF8FABEFF00AEB4DD43FE3F2C47FD
        34FF000A006A69624FDE5E3B4921E48CF03DA95F48847CD6ECF1483EE906B4A8
        A00A36172F2878A6FF005D11C37BFBD54D77ADBFFC0BFA558878D72E07AC63FA
        557D77ADBFD5BFA5006C2FDD1F4A5A45FBA3E94B40051451400514514005666A
        BF7E3FA1AD3ACCD57EFC7F434019F4519A3DA800ABB11FF8954D83FC5FE154AA
        F45FF2099BFDFF00F0A00A1452D14005140A3F1A0028A28A002A6B4FF8FC8BFD
        EA86A6B3FF008FB8BEB401BB589A9FFC85ADFE8BFCEB6EB1353FF90B5BFD17F9
        D005AD60FF00A1019E0C801FA55E002A803EE818151DD402E6DDE23FC4383E87
        B543A7BCFB1A1B8421E2C00DFDE140172B3750005F5930FBC64C7E1C5689E99A
        CDB6496F2EFED732ED4418894FF3A00BD73FF1E737FD736FE54CD3FF00E41F07
        FB82A4BAFF008F49BFEB9B7F2A8F4FFF008F083FDC1401668A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
        8A28A0028A28A0028A28A0028A28A00A161FF1F57DFF005D69F79691DC98C3CA
        51949DB838269961FF001F57DFF5D69BA87FC7ED87FD743FD2801A74941C9B99
        80F76A41A4A30CADD4C47A86ABD75FF1E937FD736FE550E97FF20D87E87F99A0
        06DAD9476D70CCB333B95C10C7A0AA9AEF5B7FF817F4AB10FF00C876E3FEB90F
        E955F5DEB6FF0056FE9401B0BF747D296917EE8FA52D00145145001451450015
        99AAFDF8FE86B4EB3355FBF1FD0D0067D145140055E8FF00E41137FBFF00E154
        6B4EC63596C9D1BA331FE9401994957CE9926789171EF47F65CBFF003D13F5A0
        0A3DA8ABDFD972FF00CF44A3FB2E5FF9E89FAD0051A2AF7F65CBFF003D13F5A3
        FB2E5FF9E8940146AD69F133CE1FF853A9A90696F91BA45C679C569222C6A150
        00A3A0A007D626A7FF00216B7FA2FF003ADBAC4D4FFE42D6FF0045FE7401A973
        E77927ECE14C9D83553DDAB7F720FCEB4A8A00C88AEB519DA45458498DB6B7D6
        AC44DA979ABE6AC423CFCD8F4A4D33FD75EFFD7535A14011DD7FC7A4DFF5CDBF
        9547A7FF00C83E0FF7053EEBFE3D26FF00AE6DFCA99A7FFC83E0FF0072802CD1
        4514005145140051451400514514005145140051451400514514005145140051
        4514005145140051451400514514005145140051451400514514005145140051
        451400514514005145140051451400514514005145140142C3FE3EAFBFEBAD3A
        FAD25B9785E29151A324824536C3FE3EAFBFEBAD4B776A6E82E2678F6E7EEF7A
        00AAD69A832956BB4208C11B6923B2BF86358D2ED1557A0DB492E9AD1C2F20BB
        98ED52719F414CB5B07B8B58E53752A9619C0340166D2D2786E9E79E55919976
        E40AADAEFF00CBBFD5BFA55DB5B236D21733C9264630D54B5DEB6FF56FE9401A
        CA070D8E718CD3E98AA386C73B714FA0028A28A0028A28A002B3355FBF1FD0D6
        9D666ABF7E3FA1A00CFA28A2800AD6D33FE3D5BFDF3FC8564D6B699FF1EADFEF
        9FE42802CCB2AC519773802B39B549371D91AEDED9EB505DDC19E63CFC80E16A
        0ED4017BFB525FF9E69FAD1FDA92FF00CF34FD6A8D1CD005EFED497FE79A7EB4
        7F6A4BFF003CD3F5AA345005EFED497FE79A7EB53DA5EB5C4851D40E3208ACAA
        B7A6FF00C7D7FC04D006C5626A7FF216B7FA2FF3ADBAC4D4FF00E42D6FF45FE7
        401A971099E228B2347CFDE5EB59F35A080665D4A55CF4C9ABF77702D6D9E53C
        91D07A9AA96BA78900B8BBFDE4CFC90DD07E14015238AD77111EA6EA58F38046
        4D5E86C1D24493ED92B80738278353C9636D2A6D6853EA062AA41BEC2F16D598
        B43273193FC27D2802F5D7FC7A4DFF005CDBF95334FF00F907C1FEE0A92EBFE3
        D26FFAE6DFCAA3D3FF00E41F07FB82802CD14514005145140051451400514514
        0051451400514514005145140051451400514514005145140051451400514514
        0051451400514514005145140051451400514514005145140051451400514514
        00514514005145140142C3FE3EAFBFEBAD5A9268A1C79AEA99E993D6AAD87FC7
        D5F7FD75A92F45AF961EE954AAF4CD0036E2F2DDADA50278C9284000F5E2A2D3
        EEA08EC2157991580E413D39A5B7B5B1B98BCC4B70173FC431551A6D3BCC2B1D
        9B4801E59471401AD1DC43336D8E456239C03599AEF5B7FAB7F4AB7602CDC34B
        6AA14F461DC554D77ADBFD5BFA5006C2FDD1F4A5A45FBA3E9505C5D2DB052CA4
        EEF4A00B14550FED48FF00E79B51FDA91FFCF36FCC5005FA2A87F6A47FF3CDBF
        3A9EDAE56E431552369EF40162B3355FBF1FD0D69D666ABF7E3FA1A00CFA28A2
        800AD2B3FF009074DFF02FE559BDEB4ACFFE41B37FC0BF950066D1494BCD0014
        5147E1400514514000AB7A6FFC7DFF00C04D54AB7A68CDD7FC04D006C5626A7F
        F216B7FA2FF3ADBAC4D4FF00E42D6FF45FE74016B5804D9038E15D49FA55F565
        640CA7208C8A491164464719561823D6B3556EF4E3B123371067E5C7DE5A00D4
        ACEBF3BAFACA31CB07DC47B7F9CD21D46E1C158ACA5DDFED0E05496769224AD7
        170C1A76FC947A50059B9FF8F39BFEB9B7F2A669FF00F20F83FDC1525D7FC7A4
        DFF5CDBF9547A7FF00C83E0FF7050059A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
        A28A2800A28A28028587FC7D5F7FD75A8B52C2DD5ABCBFEA431CE4743EF52D87
        FC7D5F7FD75A7DF5C5BC31AADC29657C80319A008B50BC8D6D19227569241B54
        29CD58B4805B5B24606081F37D7BD66C571A5C326F485C30E84A938A96E350B2
        B98BCB7F382E73F2AE28016DD95B5A99A120A6CF9C8E84D47AEF5B7FAB7F4AB3
        A7CD6877456C8CB81B8E475AADAEF5B7FF00817F4A00D85FBA3E959FAAF48BEA
        6B417EE8FA567EABF762FA9FE94019B451450015A5A57DC93EA2B36B4B4AFB92
        7D450068D666ABF7E3FA1AD3ACCD57EFC7F434019E68A28A002B4ACFFE41B37F
        C0BF9566D6959FFC8366FF00817F2A00CCED4BCD252D001DAA5B684CF3AA76EA
        C7DAA2A9AD66F227573F77A1FA5006A8B2B7031E52FE34BF6483FE792D396789
        97224420FBD289233C0917F3A0067D8EDFFE792D3D2248861142FD053C1C8E0D
        2D001589A9FF00C85ADFE8BFCEB6EB1353FF0090B5BFD17F9D006BC8EB1233B9
        C2A8C9359A86F351F9D6436F076DBD4D4BAC13F63033C33806AF2A8450ABF740
        C01E94019C74D9E31986F640DE8DD0D4B677923CAD6F70A166519E3F8855EACE
        BF016FAC9D7862FB49F6FF0026802EDD7FC7A4DFF5CDBF9547A7FF00C83E0FF7
        054975FF001E937FD736FE551E9FFF0020F83FDC1401668A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
        28A0028A28A0028A28A0028A28A00A161FF1F57DFF005D6AC5C5AC574A1655CE
        3A1079155EC3FE3EAFBFEBAD5FA00CDFB2DE5B7FC7B4E24407FD5CBFE34ABA92
        C6DB2EA1685BD48C835627BDB7B6FF0059200DFDD1C9AAAD71757ABB60B60B19
        FE3987F4A00BF1C8922EE8D832FA83595AEF5B7FAB7F4AB563A78B46690C9B9D
        86080300555D77ADBFD5BFA5006C2FDD1F4ACFD57EEC5F53FD2B417EE8FA567E
        ABF762FA9FE94019B41A28A002B4B4AFB927D4566D69695F724FA8A00D1ACCD5
        7EFC7F435A7599AAFDF8BE868033E8A28A002B4ACFFE41B37FC0BF9566D6959F
        FC8366FF00817F2A00CD145252D00145145001DE8A28A007472BC4DB91C83ED5
        B16B702E22C9E1870C2B16B4B4AE92FE1FD680346B1353FF0090B5BFD17F9D6D
        D626A7FF00216B7FA2FF003A00D3BBB71736EF11E091C1F43DAAA5ADF88C0B7B
        BFDDCABC65BA355BBBB916B0194A96C10300D5096F5675C49A748E3B645005E9
        2FADA24DCD3A7D01C9AA9007BEBD5BA752B04791183D58FAD5657B746DCBA5C9
        91D33935721BF692548FEC92A0271923814016EEBFE3D26FFAE6DFCA99A7FF00
        C83E0FF72A4BAFF8F49BFEB9B7F2A8F4FF00F907C1FEE0A00B34514500145145
        0014514500145145001451450014514500145145001451450014514500145145
        0014514500145145001451450014514500145145001451450014514500145145
        001451450014514500145145001451450050B0FF008FABEFFAEB46A315D4A88B
        6C481CEFC36334587FC7D5F7FD75ABA4E07A01EB4018D05ADDDBF2967096FEF3
        364FF3AB5E76A9FF003ED0FF00DF5FFD7A926D4EDA23B43191FF00BA9CD55375
        7B7571E4228B7F9777CC39C5005BB692F1A522E228D176E46D6E7354B5DEB6FF
        00F02FE9576D6C45B48D2B4AF248C30598D52D77ADBFD5BFA5006C2FDD1F4ACF
        D57EEC5F53FD2B417EE8FA567EABD22FC7FA50066D1451DE800AD2D2BEE49F51
        59B5A7A57DC93EA280342B3355FBF1FD0D69D64EA6E0CEAA0FDD1CFB50052A28
        EF450015A760A5EC6451FC448FD2B32B5B4CFF008F56FF007CFF002140192415
        62A46083C8A2B627B18A66DFCAB1EA477A83FB2BD263FF007CD0067515A5FD95
        FF004DBFF1DFFEBD53B8B67B72371041E8450043451450015A5A57497F0FEB59
        B5A5A57497EA3FAD0068D626A7FF00216B7FA2FF003ADBAC4D4FFE42D6FF0045
        FE74016F5804D81C0CFCC3A55B5754810BB05014724E2A5A63C6922ED755653D
        986450038104647228A00006074A5A0086EBFE3D26FF00AE6DFCA99A7FFC83E0
        FF0072A4BAFF008F49BFEB9B7F2A8F4FFF008F083FDC1401668A28A0028A28A0
        028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
        028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
        028A28A0028A28A0028A28A0028A28A00A161FF1F57DFF005D68D46D25BA8D04
        6C06D24952480D4587FC7D5F7FD75AB32DC45063CD754CF4CF7A00CE86E23B1C
        2CD6660FF6D4641FC69D0CA936B2648983298BA8AB46FECD860CF1907B1AA72C
        7A6C8DBA39D6193B321C7E9401AF58DAEF5B7FAB7F4AB766B72AC4493A4D0E3E
        571D73EF5535DEB6FF0056FE9401B0BF747D2B3F55FBB17D4FF4AD05FBA3E959
        FAAF48BF1FE94019B45068A0029CB2491E763B2E7AE0E29B47E140127DA67FF9
        ED27FDF46A3249E49A28A0028A28CD0015ADA67FC7AB7FBE7F90AC9AD2B338D3
        A6C7AB7F2A00B9E7C43832A7FDF4297ED10FFCF58FFEFA15CFD1401D07DA21FF
        009EB1FF00DF42A86A33C6F1AA23063BB3C74ACEA5A0028A28A000569695D25F
        C3FAD66D69695D25FC3FAD0068D626A7FF00216B7FA2FF003ADBAC5D4FFE42D6
        DFF01FE7401B54520A5A0028A28A008AEBFE3D26FF00AE6DFCAA3D3FFE3C20FF
        007054975FF1E937FD736FE551E9FF00F20F83FDC1401668A28A0028A28A0028
        A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
        A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028
        A28A0028A28A0028A28A0028A28A00A161FF001F57DFF5D6ACCB6F14F8F3630F
        8E99ED55AC3FE3EAFBFEBAD5FA00ADFD9F69FF003C13F2A4FECEB43FF2C12AD5
        47321962640E5091F787514019D6AA2DB5696DE2CF9453715CFDD351EBBD6DFF
        00E05FD2AFDA594768095259DBABB7535435DEB6FF0056FE9401B0BF747D2B3F
        5407646707009C9AD05FBA3E951CD0ACF1146FC08EC6803068A7CB0BC2FB5C7D
        0FAD30D00145145001451C514001A28A2800AD2B3FF906CDFF0002FE559AAA59
        82A8C9270056D18960B2745EC8727D4E2803145149DA96800CD18A28A0028A28
        A002B4B4AE92FE1FD6B36B574E85A3899D86379E07B5005EAC4D4FFE42D6FF00
        45FE75B7589A9FFC85ADFE8BFCE8036852D20A5A0028A28A008AEBFE3D26FF00
        AE6DFCAA3D3FFE41F07FB9525D7FC7A4DFF5CDBF9547A7FF00C83E0FF72802CD
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140051451400514514005
        1451400514514005145140051451400514514005145140142C3FE3EAFBFEBAD5
        FAA161FF001F57DFF5D6AFD0014514500158DAEF5B7FF817F4AD9AC6D77FE5DF
        EADFD2803617EE8FA52D350E5148EE053A8018E8AE36B2861E86AA9D3602720B
        8F606AED14014BFB320FEF49F98FF0A3FB320FEF49F98FF0ABB450052FECC83F
        BD27E63FC28FECC83FBD27E63FC2AED14014BFB320FEF49F98FF000A3FB320FE
        F49F98FF000ABB45005782D2280E5412DEADD6A6650C854F423069D450065B69
        6DBBE4906DF7147F6549FF003D57F2AD4A28032FFB2E4FF9E8BF951FD9727FCF
        45FCAB528A00CBFECB93FE7A2FE547F65C9FF3D17F2AD4A28028DBE9E91B6E90
        EF23A0EC2AF5145001589A9FFC85ADFE8BFCEB6EB1752E757B603AFCBFCE8036
        A8A414B4005145140115D7FC7A4DFF005CDBF9547A7FFC83E0FF007054975FF1
        E937FD736FE551E9FF00F20F83FDC1401668A28A0028A28A0028A28A0028A28A
        0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
        0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
        0028A28A0028A28A00A161FF001F57DFF5D6AFD50B0FF8FABEFF00AEB57E800A
        28A2800ACCD661325A0900E63393F4A9EE35082DA4D8E58B632428CE3EB53A3C
        73C419486461F9D0057D3AE05C59A723720DAC2AED6249A75D5A4C64B26254F6
        CF23DBDE8F3F58FEE37FDF028036E8AC4F3F58FEE37FDF028F3F58FEE37FDF02
        8036E8AC4F3F58FEE37FDF028F3F58FEE37FDF028036E8AC4F3F58FEE37FDF02
        8F3F58FEE37FDF028036E8AC4F3F58FEE37FDF028F3F58FEE37FDF028036E8AC
        4F3F58FEE37FDF028F3F58FEE37FDF028036E8AC4F3F58FEE37FDF028F3F58FE
        E37FDF028036E8AC4F3F58FEE37FDF028F3F58FEE37FDF028036E8AC4F3F58FE
        E37FDF028F3F58FEE37FDF028036E8AC4F3F58FEE37FDF028F3F58FEE37FDF02
        80364900124E00F5AC484FDBB5A32AFF00AB43907D874A1A3D52EC797202A87A
        E7005695959A59C3B41CB1E59BD6802DD266968A004CD14B45004575FF001E93
        7FD736FE551E9FFF0020F83FDC1525D7FC7A4DFF005CDBF9547A7FFC7841FEE0
        A00B345145001451450014514500145145001451450014514500145145001451
        4500145145001451450014514500145145001451450014514500145145001451
        450014514500145145001451450014514500145145001451450050B0FF008FAB
        EFFAEB56E4904513484121464ED1CD54B0FF008FABEFFAEB57E8033BFB62D89C
        059727A0DB47F6C5B7A4BFF7CD2CF0C8B7CB7710F336AED68F3C8F714CB093CD
        BDBA64044448383D9BBD00469A8DA25CCB301296900CFC9D314D8751B7865982
        AB88D9832A85E87BD5983FE43775FEE2FF0021490FFC876E3FEB90FE94007F6C
        DB7F765FFBE28FED9B6FEECBFF007C535AEAEE6BB923B544D911C317EE6946A1
        3CB2F976F6D929FEB3736307D33400BFDB36DE92FF00DF347F6CDB7A4BFF007C
        D26907169213C7EF5B39EDD2996D2C6355BA6322052060EE18340127F6C5A938
        C49FF7CD680208C83C566B3A3EB70946561E51E41CFAD69D004534AB0C4D2302
        428C9007354FFB66D7D25FFBE6B46B3938D724CF19878F7E45001FDB36BE927F
        DF347F6CDAF712FF00DF34921075D8791C4473FAD3754BA8BECF35B6EC4981C6
        3AF22801FF00DB36DFDD97FEF9A3FB66D4F697FEF9AB709096B196214041924F
        B551D2A68D2DA40F222932B1C160280258754B69A558D7786638195ABF599624
        36A3785482091822B4E800AA71EA304B2F96A5B93B4315E09F406ADF5AC4BB89
        ACE258564431F9A1D413F3AFFF005A802F4DA94104AD1BACBB97AFCB4CFED9B5
        F497FEF9A9EE6689AD66559518F96D80187A5456BFF2041FF5C8FF005A006FF6
        CDB7A4BFF7CD1FDB36A7B4BFF7CD4363E65BD9453AE5E261FBC4EE39EA2A6D1B
        9B473FF4D1BFA5001FDB36BE92FF00DF347F6CDAE3A49FF7CD4761FF0020EBAF
        F7DFF954127FC8BF07FBC3F99A00B7FDB16DFDD97FEF9A3FB66DBD25FF00BE6A
        C5F3AAD9CA1980CA10327AF150D84F12D8C2AD2A021790585003EDF5082EA429
        1EEC819F9862AE56768DFF001E4DFF005D1AB468022BAFF8F49BFEB9B7F2A8F4
        FF00F907C1FEE54975FF001E937FD736FE551E9FFF0020F83FDD1401668A28A0
        028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
        028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0
        028A28A0028A28A0028A28A0028A28A0028A28A00CFB6FDDEA97517F7B0E3FAD
        68567DF0304D0DE01909F2BFFBA6AF2B0650CA72A4641A00CBBCB2955E5B9825
        60187CEA3A91DF1576CD214B54FB3FFAB2320FAFD6ACD450C11C0A5635C02C58
        8F734014E0FF0090DDD7FB8BFD2887FE43971FF5CC7F4ABA22412990280E4609
        F5147949E699428DE4609F51401538B2BB9246FF00533104B7F75BDFEB56A28A
        28C3344AA039DC71DE9EC032E08C83D8F7A645124281235DAA3B50052D240369
        202320CAD9FD284D22DD27919943467EEA1FE1ABC91A46182285C9C9C7AD4940
        194208ADF5A856240AA632481F8D6AD67CD6B722EFED114AAD8FBA8E3F319AB3
        05C2CE9900AB038653D54D004F504F6D1DC01BF21874653822A7A2803223B68E
        D7598510B1CC6492C7249E6ACDED98959674456963E403D187A55A312191642A
        37AF00F7152500554786FED9948E08C329EA0D4106936F1A112A89096E18FA7A
        55D5891247755019F1B88EF5250065E9F1AC7A85E2200AAB8000ED5A959A905D
        5ACAF36E13AB7DE18F9F157A3916540E872A7A1A0092A95E69F15DB2B93B5C77
        C751E86AED1401466B2B68ADE6748555846D8207B53B4E00E9D0E40E579A66A5
        23010C41FCB595B6B3FA0A8ADE65B505125135BA1C310398FF00C45004A74F3B
        7CA4B89120CE7CB03F4CD33460059B01DA46FE957C10C323041E8452471A4618
        220504E4E3D6802B4D63E69631CCF16FFBE17A3557D4A15B7D31224CED560056
        AD47246B2A14750CA7B1A008AEAD63BB87CB7FA83DC1A862D2AD962559225770
        396E79ABF51CAAD246CAAC5091C30ED4014B46FF008F261FF4D0D68D66C027D3
        D713157858E4BA0C6D3EA47A5680208041C83E94015B5193CBB0948EA5768F7C
        D4D6E9E5DB448460AA007EB8AA7727ED77B1DB2F2919DF2FF415A34005145140
        0514514005145140051451400514514005145140051451400514514005145140
        0514514005145140051451400514514005145140051451400514514005145140
        05145140051451400514514005145140051451400D650EA5586411823D6B3879
        DA61202B4B6B9E31D53FFAD5A74500568EFED641913A0FF78E3F9D3FED56FF00
        F3F117FDF6291ED6DE439786327D76F34DFECFB4FF009F74FCA801FF006AB7FF
        009F88BFEFB147DAADFF00E7E22FFBEC533FB3ED3FE7DD3F2A3FB3ED3FE7DD3F
        2A007FDAADFF00E7E22FFBEC51F6AB7FF9F88BFEFB14CFECFB4FF9F74FCA8FEC
        FB4FF9F74FCA801FF6AB7FF9F88BFEFB147DAADFFE7E22FF00BEC533FB3ED3FE
        7DD3F2A3FB3ED3FE7DD3F2A007FDAADFFE7E22FF00BEC54625B4121904B16F23
        04EF1CD2FF0067DA7FCFBA7E547F67DA7FCFBA7E5400FF00B55BFF00CFC45FF7
        D8A3ED56FF00F3F117FDF6299FD9F69FF3EE9F951FD9F69FF3EE9F95003FED56
        FF00F3F117FDF628FB55BFFCFC45FF007D8A67F67DA7FCFBA7E547F67DA7FCFB
        A7E5400FFB55BFFCFC45FF007D8A3ED56FFF003F117FDF6299FD9F69FF003EE9
        F951FD9F69FF003EE9F95003FED56FFF003F117FDF6298B35AA6EDB344371C9F
        9C7268FECFB4FF009F74FCA8FECFB4FF009F74FCA801FF006AB7FF009F88BFEF
        B147DAADFF00E7E22FFBEC533FB3ED3FE7DD3F2A3FB3ED3FE7DD3F2A002496D2
        542924B0B29EC5853637B38536C7240ABDC061CD3BFB3ED3FE7DD3F2A3FB3ED3
        FE7DD3F2A00239AD228C247344AA3A0DE38A7FDAADFF00E7E22FFBEC533FB3ED
        3FE7DD3F2A3FB3ED3FE7DD3F2A007FDAADFF00E7E22FFBEC51F6AB7FF9F88BFE
        FB14CFECFB4FF9F74FCA8FECFB4FF9F74FCA801FF6AB7FF9F88BFEFB147DAADF
        FE7E22FF00BEC533FB3ED3FE7DD3F2A3FB3ED3FE7DD3F2A0056BAB6C1DD3C58E
        FF003035505D6F516FA7A6EC71E611F2AD5A1636A0E45BC7F954EAAAAB85000F
        4140105ADB2DB45B41DCC4E5DCF5635668A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A
        28A2800A28A2800A28A2800A28A2800A28A2803FFFD9}
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 410.078740160000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Child = frxmyrepo.Child1
        DataSet = frxDBAdmStudXI
        DataSetName = 'frxDBAdmStudXI'
        RowCount = 0
        object frxtbTrnsMstempName: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 120.944960000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          DataSetName = 'frxtbTrnsMst'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Form no. :[frxDBAdmStudXI."studid"]')
          ParentFont = False
        end
        object Rich1: TfrxRichView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 729.449290000000000000
          Height = 105.826840000000000000
          Frame.Typ = [ftTop]
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313033337B5C666F6E7474626C7B5C66
            305C6673776973735C66707271325C6663686172736574302043616C69627269
            3B7D7B5C66315C666E696C5C666368617273657430205461686F6D613B7D7D0D
            0A7B5C2A5C67656E657261746F722052696368656432302031302E302E313833
            36327D5C766965776B696E64345C756331200D0A5C706172645C73613230305C
            736C3237365C736C6D756C74315C71635C625C66305C667332385C6C616E6731
            36333933204A414D53484544505552205055424C4943205343484F4F4C5C6C69
            6E655C756C5C62305C667332322050414E4348415641544920524F41442C204E
            455720424152494449482C204A414D53484544505552205C656E646173682020
            3833313031375C7061720D0A5C625C667332382041444D495420434152445C75
            6C6E6F6E655C62305C66315C667331365C6C616E67313033335C7061720D0A7D
            0D0A00}
        end
        object mmPF: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 147.401670000000000000
          Width = 427.086890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Name :[frxDBAdmStudXI."NAME"] ')
          ParentFont = False
        end
        object frxtbTrnsMstattnd: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 181.417440000000000000
          Width = 98.267780000000000000
          Height = 15.118120000000000000
          DataSetName = 'frxtbTrnsMst'
          Frame.Typ = []
          Memo.UTF8W = (
            'Subject option :')
        end
        object frxDBAdmStudXIadm_subdescr: TfrxMemoView
          AllowVectorExport = True
          Left = 105.826840000000000000
          Top = 181.417440000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'adm_subdescr'
          DataSet = frxDBAdmStudXI
          DataSetName = 'frxDBAdmStudXI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBAdmStudXI."adm_subdescr"]')
          ParentFont = False
        end
        object frxDBAdmStudXIadm_optsubj: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 207.874150000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataField = 'adm_optsubj'
          DataSet = frxDBAdmStudXI
          DataSetName = 'frxDBAdmStudXI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBAdmStudXI."adm_optsubj"]')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 521.575140000000000000
          Top = 98.267780000000000000
          Width = 139.842610000000000000
          Height = 147.401670000000000000
          Frame.Typ = []
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 143.622140000000000000
          Width = 90.708720000000000000
          Height = 52.913420000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Recent digital Passport size photograph')
          ParentFont = False
        end
        object mmExdt: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 291.023810000000000000
          Width = 650.079160000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '---')
          ParentFont = False
        end
        object mmVenue: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 328.819110000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Venue :')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 328.819110000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Principal')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 11.338590000000000000
          Width = 128.504020000000000000
          Height = 90.708720000000000000
          Frame.Typ = []
          Picture.Data = {
            0D546478536D617274496D616765FFD8FFE000104A4649460001020100960096
            0000FFEE000E41646F626500640000000001FFE11D964578696600004D4D002A
            000000080007011200030000000100010000011A00050000000100000062011B
            0005000000010000006A012800030000000100020000013100020000001C0000
            007201320002000000140000008E8769000400000001000000A2000000C20096
            000000010000009600000001000041646F62652050686F746F73686F70204353
            332057696E646F777300323031353A30323A30372031313A33393A3331000002
            A00200040000000100000109A003000400000001000001600000000000000006
            010300030000000100060000011A00050000000100000110011B000500000001
            0000011801280003000000010002000002010004000000010000012002020004
            0000000100001C6E0000000000000048000000010000004800000001FFD8FFE0
            00104A46494600010200004800480000FFED000C41646F62655F434D0001FFEE
            000E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A
            0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E
            0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A00078030122
            00021101031101FFDD00040008FFC4013F000001050101010101010000000000
            0000030001020405060708090A0B010001050101010101010000000000000001
            0002030405060708090A0B1000010401030204020507060805030C3301000211
            0304211231054151611322718132061491A1B14223241552C16233347282D143
            07259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384
            C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6
            F637475767778797A7B7C7D7E7F7110002020102040403040506070706053501
            00021103213112044151617122130532819114A1B14223C152D1F0332462E172
            8292435315637334F1250616A2B283072635C2D2449354A317644555367465E2
            F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6
            D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00EE4B323A
            E66DCDF5ACA3A3E23DD41652E755664DEC3B723764D7B2DAF0F12CFD5F651656
            FC8CBAB23D6FD5AAF4F21F1FA37D58C8BF271EAC4ADD6E1BDB55ED20C873ABAF
            259F4BE96EAAE67B90F03128C9FAA18E2FC8BB0DB65032ADC9C7B1D558C7D939
            77DE2C67FC259658F6D9EA56FF00F095AE33EAAF44EBEDEB98F675AB3A861E37
            556BAE6D8DB5D5BEFB6AF7D34F53750EF531AC7E2FA967A6F7D7FE87FD254929
            EFBFE6CF41FF00B8557DC7FBD3FF00CD9E83FF0070AAFB8FF7AD34925387D43A
            47D57E9D88FCCCBC46329ACB438B58FB1D2F736AADADAA9165AF73EC7B19EC62
            AB533EA558D7BBECC2A754FA596557D175360390F18D8AEFB3E4D755DE9DD7BB
            D3F5BD3F4BFEDB56FEB96FFD8167A65A2CF5F13D32F92D0FFB5637A7EA06ED7F
            A7BFE9EC597D77A6E6D543BAD758C9A5F6D3660D4D1456EAAAAA86E7E2E5655D
            6BAEB6F7D9FCD56FB2C77A7551551FF1AF494E86774FFAA5D3E465E3555EDA2E
            CB3EC7BBF438DE9FDAACFD1EEFE6FD7ABD9FCE3FFC1AAF5B7EA53EACAB5D8A29
            FB0D272726BBF1EFA2C6D203CFAEDC7C9AEABEDABF4567BEAADFFB883F5D5F59
            B722B0E05F5F41EACE7B011B835DF616B1CE1F9BEA7A766CFF008B7AA5F582BC
            EC57F546753C9AFA86464F42CEF41D55668FB3D7535BEBEFA3D6C8F5199D65B4
            FE9DEFFD1BF13D2AFF009CB1253BF95D1FEABE21A0646256C3956B68A7DAE336
            3C39CC67B376CFA0EF73FD8A964B7EA7E3E4BF15B80FCAB293B723EC98D7E436
            A275D97598B5DAC659B4FF0033FCF7FC1ABBF597F9CE8D3FF9654FFD45E97D4F
            7D63A0636313199880D5D42B73B758DCB04BB35D77B9DEFBF21D664EFF00F0D5
            DDEBFF0037624A5F07A3FD55EA18B5E66163D1918D70DD5DB5EAD23E89EFF9AE
            F63FF711FF00E6CF41FF00B8557DC7FBD1BA564F4BCAC5764F4A35BF1ADB6C26
            DA5BB596581EE6645AD706B5B76FB9AFFD61BFCF7FA457525399FF00367A0FFD
            C2ABEE3FDEABDBD1FEAC5599460BF16B6E464B2CB29680412DABD3F5B6B81F6B
            99EBD6B69CD0E696998220C120EBE0E6FB9ABCA7ADF46EB9575CBB3B0F23A8DD
            D27A65ACA9D9E6D3664535D9B7F688C0DDBAEC9AB158ED96D9B1FF004365DEB7
            A163D253DE345DD0F328A4DD65FD2B31E28AFD673ADB31EF74BA96FDA6D73ADB
            70F29DFA067AEFB2DA32FD0A6AFD0647A78892EB1895E27D59B2A65965DF646B
            2DAEEBAC75B639F4D8CC9AADB2EB0B9EF77AD5B5FF00F50924A7FFD0F43FAB5F
            F89EE99FF8569FFA86AD259BF56BFF0013DD33FF000AD3FF0050D5A4929CDEB9
            D6E9E8F8F5BCD4FCACAC9B0518587547A975AED430177B2AAD8D1EA5D7D9FA3A
            6BFF0031670EB3F5D63FF13957FEE419FF00BCAA59AC6DDF5EBA58B06E18D819
            7753FC97B9F8B43DFF00F6D3B62E85253CC5FD47EB6E457E9647D58C7BAB25AE
            D8FCFADCD9638595BB6BB17F32C635EC52B7AA7D70BAB7D56FD59A2CAAC6963D
            8ECFADCD735C36B98F6BB176B9AE6AE952494F1B89575AC2A6FA313EA6E15356
            58DB935B332A0DB1B0E67A770FB27E92BD8F7B3D377B13E357D6B129BA8C5FA9
            98145594DD9915D7974B1B6361CDD97359863D566DB1FF004D6CBBEB77D5E6B9
            CD765C39A4B48F4ECE4183FE0D1317EB3743CBC866363E507DD69218DD8F6C90
            0BBE93D8D6FE6A1C43B8621CC612686581274AE28DDB838B4F58C33389F52F03
            1CEF6D9FA2CAA59EFAF70AACF6618FD257EAD9E9BFFE112CEA3AC751BC6467FD
            4CC1CAB9A037D4B732A7B8B47D1639CEC4F7B3F90E5B27EB7FD5D04839824120
            FE8ECEDFF5B4BFE787D5CFFB99FF0081D9FF00A4D2E21DC23EF383FCEE3FF1E2
            D36755FAE35B1B5D7F56A86318035AD6F5060000D1AD6B462A97ED9FAEBFFCEE
            53FF00B9067FEF2AB5FF003C3EAE7FDCCFFC0ECFFD26B4307A8E0F50ABD5C2B9
            B7301876DE41F07B1D0F67F6D2B07AAE866C53350C9191ED19464D5E87D6EAEB
            18F6BBD27E2E5E2D868CDC3B63D4AAD0376D96FB2DA9ED77A945F5FE8EEAD69A
            E7B118DA7EBDF52158DA327A762DD747E73D96E550C79FFAD3762E85164733EB
            2FFC839DFF0014524BEB2FFC839DFF001452494FFFD1ECB13A96460FD58E8ACC
            3A5B919B9B5D18D8B5BDFE9D7BCD4EBDF65F6ED7B995538F45F6FB2B7D966CF4
            99FCE2957D7BADB2DB7A5DDD3864757AF6398EC77918669B770665DF956B7762
            7A4EAAC65B89B2FCB7FF00398B5E457FCCD7FB064E6FD54E89F64A9F66463B28
            B6B35E47D95CCFD03E8758DBFD2C9DDFA3B9F57A5E9FF84543230BAF6251664E
            6B7A8B71696B9F7BF1BA9B6DB5AC68DCFB2BA2CC5C6F57637F33D5F53FD1FA89
            29D8BE7FE7CE04F3FB332663FE3B11740B9DB1ECB3EBBF4F7D6EDEC7F4BC9735
            C35906EC32D72E8925292492494F90E47F49BBFE31FF00F54E57FEACFF00CBF8
            3FF187FEA1EA8647F49BBFE31FFF0054E57FEACFFCBF83FF00187FEA1EA01D3C
            C3CB61FF0074C3FDA0FF00A4E73FE9BBFAC7F2A8AEF9FF0050BA3B9EE70B7258
            1C4BB687B08126768DF539DFE7390727EA2F49A71EDB5B7E49756C73802E644B
            46EFF429DC126CCBE17CCEA7D3DFE67875D2FD4124758BDA09838C491D890FAB
            6CFF0057739734D3201F10BA4FA85FF2CDDFF859DFF9F29423B861E47FDD58BF
            BCEF51FF008BDCBFFD3563FF00E7FCB5D02E7E8FFC5EE5FF00E9AB1FFF003FE5
            AE814CF4CE67D65FF9073BFE28A497D65FF9073BFE28A4929FFFD2EB4655B8DF
            54BA37D9EFBE8C8B998D552CC5AEAB6DB5CEAFF98637307D9D8DD8D7E45B758E
            ABD2AA8FE71361E16675AAB271337AAE6B195BBD0CFE9F6D7895D9B5ED6D9E9B
            EFC2AEDFD0E45167F3B8B7FF00D76BB77A8BD98E3EA8F46CCB72AEC37E0B31ED
            C7B31EB6DD63AD7D2EC1AF1EBC7B6BC8F59F7FDADD5B19E9FD35440EA7839166
            666E4F55E96DCE7D55DD9F757D36DA8380F471BED0CC46643F119FE0FD5D9E87
            BFF4D6D4929D8B9AD67D79C063006B5BD332435A34000BB0F40BA15CFE47FE2E
            B07BFF00933275FF00AF622E8125292492494F90E47F49BBFE31FF00F54E57FE
            ACFF00CBF83FF187FEA1EA8647F49BBFE31FFF0054E57FEACFFE28307FE30FFD
            458A01D3CC3CB61FF74C3FDA0FFA4FA7A067FF0041C8FF008A7FFD495CA1FF00
            187A9D9D3C96CFB49BA091F9B2DF45DB50F23EBF3AEA2CA7EC1B7D46399BBD69
            8DC36CC7A214BC71EFF83B92F88F2B447B9D0FE8CFFEF5E49BF447C02E97EA17
            FCB377FE1677FE7CA573604003C1749F50BFE59BBFF0B3BFF3E52A38EE1C6E47
            FDD58BFBCEDFAD551F5DF3EFBDEDAA9ABA450FB2C790D6B5ADBF2DCF7BDCEFA2
            D6B56959F583A5D5D3E9EA36D96578F90EDB4075370B5E7DDEDAF0CD5F6C7FB5
            8FB3F98FE67F4FFCCAC3EA5838DD43EB4755C3CB7FA545BD1E8DF6C81B36DF94
            F6DB2EF67E89CDF53DFF00A3FDF55E8EA79D664FEDDCA6E466E3D38EEA7033A8
            C0D98D58BB63EEEA0EC2B336DEB398C7FA78FEFC6AEAABECCCB7D0FE7FD7533D
            33BBD6F2B1B33EAC656562D8DBA8BA82EAED6196B81EED704955C8C4AF13EA66
            4575E4FDB45955990ECB1B436D7E43DD9975F58ABF46DAADB6F7BE96B3FC17EF
            A4929FFFD3EAEBA731FD03EAD6461D032ACC375373A83636B2E69C4C8C7F63ED
            F66F63EF65BFD852EB197F587A8748EA1803A37A67271EDA0D8ECAA4861B2B73
            3759FD5DFBD09DEB55F573EAD66D2DA9E709D4DCEAEEB9B8E1C1D89918DB5975
            A1ECDED7647A9B167E5E6F51BB0FAED1E86137F6E07ED79EA154561D8B4F4DF7
            7B3F49B5D8FEAFB5253B96823EBC74F0E32474BC993E7EB61AE8573B70DBF5DB
            0048F6F4BC913DB4BB0D7449294924924A7C8723FA4DDFF18FFF00AA72D0FAB1
            FF008A0C1FEBBBFEA2C59F91FD26EFF8C7FF00D5395FFAB3FF002FE0FF00C61F
            FA87A8074F30F2D87FDD30FF00683FE9396CFA03E09D76DD6B1BEA674BB40CAC
            32FBEE25FE8D05D2019F7ECF56AAAAAF77D06FFDB6B37F687D45FF00CACC8FBF
            FF007E91E1AD2C3364E47824632CF8811D0997FDEBCDAE9FEA0D369EA9917869
            F49941ADCFEC1CE756F6B3FADB18E50FDA1F517FF2B323EFFF00DFA5D17D5AEA
            DD1F2AB7E174BA2CC6AF18076CB00D77977BB736CB773B70FCF462351A866E47
            9680CF027342446B18C09E294BFC28B91D7B0F2B3BAFF59C4C41BEFB7A2D0195
            486FA9FA7CA73B18BDC5AD67DA5BFA0F77FA45D457D4B19FD37F69B8595638AC
            DCF6BEB70B1A1A0BAC63F1F69BBD566DDBE96CDFBD625CCA6CFAE5D4597D8EA6
            A7748A03ED6BCD4E68F5F2E5EDBD8E63EADBFBFB954B713A4B7AE636237ABE57
            D92CC4C8B6CFF295E7F495D9875D3EFF00B46F67E8EFC8FE459FF5B52BBAD918
            D7637D48C96DD4FD99D60C9BDB8C743532FBEDCBA31DCD1ED63E8A2EAEA7D6DF
            E6D2573AA558F4FD54CAAF1AE7E452DA5FB2EB2D75EE77BA4EEC8B5D63ECF77B
            7E9A4929FFD4ED705FD399F557A51EA38CECBA7D0A36D6DC67E590EF4F47FA18
            F5643D9EDDDFA5D9FF0056B3300FD5DAF33AA3F27A3DC69C8C963F141E9392E1
            E90C6C4A5FB5BF623E9FEB35647E8DFF00F19FE115A156659F557A2FA0DBECC6
            6328767D388EF4EF7D0297FB28B1AFA6CF6E4FD9ACB994DB5DB6D0CB6BFF0081
            B6BF50C5EA5938395D62EC7CE1D5725EEABA1E1D3639AEC6059B316CC96D16B3
            0E9F5ADADD999D665BECABD2B2BC2BBD5FE8E929D1BE3FE7D60471FB3327CBFC
            3622E8173B67A9FF003DFA7FAA41B3F65E4EF2DD06EF5B0F76D9FCD58DF5E723
            22AEB35B6ABACADA719876B1EE689DF76B0D2848D0B60E679818319C84715102
            878BDDA4BC8CE6E6C1FD66EFFB71FF00F925EA1D1DCE7748C17389739D8F5124
            99249637524A1195F462E539E8F332901031E117A9B7CB723FA4DDFF0018FF00
            FAA72BFF00567FE5FC1FF8C3FF0050F54323FA4DDFF18FFF00AA72BFF567FE5F
            C1FF008C3FF50F510E9F470B0FFBA61FED07FD26A67DF6E4E7645F71DD6596BC
            B8FCF6B5A27F358D1B18ABA25FFCFDBFF18FFF00AA2ACF46C1AFA8F54C7C2B6C
            35577388738730D6BACDAC9FCF7EDD89059C32C997846B29CAB5FDE91692EAFF
            00C5F7F4CCDFF8BAFF00EA9EB5BFE63742F0BBFEDC2AFF0049E83D3BA4BAC7E1
            B5DBAE003DCF71768DE1A3FCE4F102083A3A9CA7C3B362CF0C9231E18DDD1F07
            0BAB65E361FD65EAF939348C9AABE8D44E338022D26FCB6578E7707B7F4F639B
            57B9A8957D4CC97630B2EC8C5666B88B1D8D5E0E29C10E1FE07D3B28FDA36D5F
            E0FD6FB7D57FF84FD0FF0034A597814752FADDD4F032245593D1E8ADC5A61CD9
            BF2FF495B8876DB2B77BEB77EFAA8CFADFD469A7ECEFBF0721B5BC52EEB84653
            716776CF5AE6D386FE9ECB3FD254CEB35D1EB7FDA8C7523B0E85D7D37FD4CC97
            538CDC20C65D4D98B58686576D363F1F2995FA7B58EAFED355BB2CFF0009FCE2
            48DD4702BE9DF54B2712B7BADDB53DF65CF32EB2CB1C6FC8BDFF00CABEFB2CBB
            DBECF7A4929FFFD5ECF17A1E075CFAA5D2F1339AE2C65145B5B98E2D736C6D7B
            1B67FA3B3DB63FF47732DA7F7EB58593D3FA374DCE182EE9DD3BAFBE435F8D8B
            8CC667B0123DF914E331F80EF63FF9DBFF006353FD75B74F4EA7A8FD4FE9B55F
            9B7F4FA2BC7A6DB6EC7B1B54B1B5FBAABECB1AF6FD99DBBF4AC5958D6D7481D3
            BEAC750CECD243ECAAAC3A3A7E3E2434B5965BF6DB7A7578B657EAD8C65AFC3F
            B65DFF0004929D9BFF00F17581A47F933274FF00AF622C1FAFBFF2D55FF8599F
            F9F2F5BD7CFF00CF9C09E7F6664CFF00DBD88B07EBEFFCB557FE1667FE7CBD36
            7B347E29FEE597F7A2F36785EABD17FE46C0FF00C2D4FF00D4357951E17AAF46
            20746C1274031AA93FF5B6A6C372D2F837CF93FBA1F2EC8FE9377FC63FFEA9CA
            FF00D59FF97F07FE30FF00D43D67DAF6BEDB1EDFA2F7B9CDF8171705A1F567FE
            5FC1FF008C3FF50F4C1D3CC3470FFBA61FED07FD2685FF00CFDBFF0018FF00FA
            A2A0D739AE0E692D73482D7030411C39A42E87A97D4CEB0CCCB5D875B7231DEF
            73EB21ED6B8071DDB2C6DA59EE62CDCEE81D63A7D3F68CBC635D321A5E1CC780
            4FD1DDE939FB51A23A272F2D9E129138E604493C54787CF8980EB5D641919F93
            F3B5E7F295DA7D4EEB599D4F1AFAB308B2DC57340BA002E6BC3B6EF6B7DBBD9B
            3E9AF3E5D8FF008BDE3A87C69FC96A3126C363E1B9B21E663133918C84AC137B
            46D87D62AF2ADEB7D6EBC46BDF73BA252365609B1CDF5F2FD6AE90DF77AF653E
            A574FF00C2AE9B1B33A3BBA457958D6503A48A7D9602D6D0DA5A36C7E6D75555
            B5BB367F835CE75BCEC8E9FF00587ACE6E2807231FA2D2FA816978DC2FCBDBEC
            6FD3477FD4CC8B324E5BEDE98ECA2FF50DEEE98C2F2F9DFEAB9DF6AF75BBBFC2
            FF0038A57A0552C2CFA8770DAFAE92CC8388CB2773715D75AEE9CC87CBD9B300
            E33595BFDF5FF3692D0EB15E5D5F55F2EBCCB9B9390DA5DEA5CC67A4D76BED8A
            77DBB3DBEDFE712494FF00FFD6EAACABA0DBF53FA3FEDCB3D1A18CC77E3DB2E0
            597B6A3E8D8DD81ED7398DF53D9732CA7F90B3FF006F578DD52BCEA3AB62F582
            CA6CC7655924615E5B63EABFFA57A6DE9D7DFBA9F4A9ADD474E67FC3AEA7EAD7
            FE27BA67FE15A7FEA1A89D6B0723A8F4DBF028B5948CA63A9BACB186C8AAC0EA
            EEF4EBDF5B7D5D8EFD1FA9FA3FDFAEC494E6DFAFD7AC0311FE4CC9D3FEBD88B0
            7EBEFF00CB557FE1667FE7CBD6E5958ABEBB74EADA496B3A5E4341719302EC31
            EE71FA4ABFD71FABF979CF6750C26FAB654CF4EDA47D22D04BD8FABF79CDDEFD
            CC4D98D1A7F11C73C9CB4840711B068783C3A97A96EDDBBDDB6236EE311FBBB6
            548E3E43496BA9B039A6082C70208EC7DA9BD1BFFD13FF00CD77F7289E778663
            A10C169FD59FF97F07FE30FF00D43D67FA377FA27FF9AEFEE5BDF53BA4E4E475
            56663D8FAF1F125C5EE6C073C8D8CA9BBA3F7BD47FFEA4446A479B37298E673E
            30227E607E91DD35DF5EFAB36EB1ACA31C31AF735A1C1E4C025ADDCE163773BF
            B2A9753FAD9D4FA9E1BF0EF652CAAC2D2F35B5C1C76916344BDEFF00CF6AC8C9
            21B93735DED736C78734E8410E7684143DECFDE1F7A5C47A95D939BE64F144E4
            9709B891E0BAEC7FC5EF1D43E34FE4B571BBD9FBC3EF5DE7D45E9D978B8B9193
            90C353728B0D4C708716B03BF485BF9AD7FA9EC461F3064F85C6479A8900D444
            B88F6F4A7A7FF17B97FF00A6BC7FFCFF0096BA05CFD3FF008BDCBFFD35E3FF00
            E7FCB5D0295E89CCFACBFF0020E77FC51492FACBFF0020E77FC5149253FFD7F4
            3FAB5FF89EE99FF8569FFA86AD2593D0B228C6FAB1D3AFC9B194D2CC5A77D963
            835A258C6FB9EF86B7DC8995F583A5D58F6BF1F2B1B23218D71A71C6454C3658
            04B280F7BF6B1D63B6B3DC929A19AF6D5F5EBA59B0ED19381974D3FCA7B5F8B7
            BD9FF6D377AE857279997D33AE6136BEA59F8BD33AA60DA2DC4CCC5CAAEC6B2C
            0DF65F43EDF47D6A5FB9F464E2E453FE93FEEBE4208BFAC469F5D3A710393F66
            A3E1FF00735253D924B9063BAE3DEDAD9F5C701CF7101AD18B4924B880CDADFB
            67E7EE5632303EB6E3546EC9FACF8D454D8DD659835B1A24ED6CBDF961BEE714
            94F4E9971E6DEB2267EB974F1060FEAB4E87C3FA6A5EAF5A923FE7974F9024FE
            AB4E83C7FA624A7AE35D64C96824F248097A357EE37EE0B99C6C5FAD1961CEC4
            FAD589901B1B8D5855BC09D46ED996E527E07D6DAEDAE9B3EB3E332DBE7D1ADD
            82C0E7ED1BDFE9B0E5EE7EC6FB9FB525507A4F4AAFDC6FDC14D71C2DEB4E8DBF
            5CBA79DD3118B4EB1CFF00DAD4BD5EB4469F5CFA7EA0907ECB4F0393FD33F352
            53A188F6DDF5EFA93AB3B86374EC5A6E8FCD7BEDCABD8C3FF5A3BD742B9EE86E
            FABFD1F1EDDDD5A8CACBCAB3D7CDCDBAEAF7DB6B87D286BB6555358DD98F8F5F
            E8EAA96B55D5FA4DD68A69CDC7B2D71DADAD96B1CE279DA18D76EFCD494D7FAC
            BFF20E77FC51492FACBFF20E77FC5149253FFFD0EFBA0B596FD5BC4A5D5B6E35
            50287D4FFA26CA7F416D6F90EFA37D4E67D15CA57D2D83EADF5FB2DC5662B70B
            A63F0EBC2B3D2B2FA9F4D59193BB22EA19B3D9F6BDB83733F4B9389E9E5E4FA9
            75CBA62FC8E879B73BD0B2FE8F96F75E5F4B5D6D98D7BCEEC80EC6AB7DB661E5
            D9FAC6FA2BB1F8F956E47ADFAB5BBF1CBFB7FEADEF7D9F69A43EC68658E23DCE
            6B776D659EDDDB59EA3FD8EFDF494E2E761B1BD57AC8C1A2B63EAA7A6B9C6BA6
            B7BEBA4DB93F6DBA8A5F55CCB321B862D754DF46DF51ECFE6ADFE6D337A6B075
            5E8B7645B8D998F93957371BD1AA9D8EA5B8994EAB22CB6AA98EBB2AFF00A791
            E97EA3FE831ABF496F0FAC9F57C1DC332A048009EF0381C79A8B7EB07D5C6001
            9954B4071780047B9C5CE7BFE8FD27B9EFDE929E729E979D8B7F49AFA874CC3C
            763FAC645A1F559EB59FA4FDA39343367D969AFD16B1ECF46DF5FD5FE67F57A6
            DFD1D5DADF455914BA9B98DB2B7882D7B439A7E2C7CB5CB17A8753FAB1D41B5F
            AB9E2BB2877A945D558FADEC7C399EA3767B2CF6BFF9ABD96D0FFF000B5588F8
            FF00593A3B6963723A85365C043EC682D0E23F3BD3F7ECDDFD7494F3FD3FA4E4
            62F53C5E9AFC2C36E4E1F47BAAC5B5F0F65F654EC2A9B93915B2B6DB4D5EA0AF
            F3ECB7F496FF00D75B1FA3DF674AE96CC2C0C4C9CCC5CF7DBD4EAB36D028B1DF
            68C8B311F35643DD552FCB6D7558CFE769FB365D155B8F7FA8BA4FF9C9F57F70
            77DB2ADC0100EB3079EDFC94C3EB1FD5E0E73866541CEFA4472634F768929A9F
            546AF4D9D50BE8AB1EE3D42D16D746AC10DAB6B5B67A78EEB5BB4FD27535A97D
            66E919594EC4CDE9D4B6DCFC7BE86B8BECF49BF671918F9790D74D57EEF7E2D2
            FF0067A777FA3F53FA2648F1BA8FD5EC3CCB2FC4EA4D65592F7D9958EF73EC63
            AC7FBBD6A7D473BECCFDDF49957E8367F8157BFE73741FFB9B5FDE7FB9253CF5
            9D0CF51B7ADE33F0B19993BB02C7535EAC22B2DC8BA9A727D2C6B3F4F555E9FA
            9B2AF4ED7A8E0F49FDA0EEB35BF12B6E6539D8370AAD6D5EA1650DC3CBF46E7E
            3FA98EDBF269A5F5FE89FF0067FD2FFC62B38F91D2F173F273A8EB147A9916FA
            A4BAB797BDAE76E7636659EB6CC8AA8AFF0043D3BD2A319F82CFF4FF00ACFDA7
            687D64FABE092332A93C9D64C7C925385D3FA4B71FAAE232DC1A5B956E3757CA
            6E3DA1800F57330F230EABEDA5B90C6BAAAAE6D4F7D5F68F47FC17AA83D13A66
            661750FAB98DD47031716CC7C3BDA1D5385B61B1ACC66BBD6FD5EAAEAB5BFBF4
            E464EF5D1FFCE4FABF21DF6CAA4680EB3079EDE4A9750EA3F57732CAF259D445
            19B8C1C31AFADCFF006EEDA5EDB31DBFA2CAADFB1BFA2B59FF0015E9D9FA4494
            DDFACC47EC4C967E75DB2860F17DCF663D4DFED5B6B1255EA391D73271AEB6A7
            D3D3309C2E69B58EA9D9390D05B5BBECB77E9A9C2C57FE9EBFB437D6BF2BECF6
            D7FA0C7F532D24A7FFD9FFE20C584943435F50524F46494C4500010100000C48
            4C696E6F021000006D6E74725247422058595A2007CE00020009000600310000
            616373704D534654000000004945432073524742000000000000000000000001
            0000F6D6000100000000D32D4850202000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000011
            63707274000001500000003364657363000001840000006C77747074000001F0
            00000014626B707400000204000000147258595A00000218000000146758595A
            0000022C000000146258595A0000024000000014646D6E640000025400000070
            646D6464000002C400000088767565640000034C0000008676696577000003D4
            000000246C756D69000003F8000000146D6561730000040C0000002474656368
            000004300000000C725452430000043C0000080C675452430000043C0000080C
            625452430000043C0000080C7465787400000000436F70797269676874202863
            292031393938204865776C6574742D5061636B61726420436F6D70616E790000
            646573630000000000000012735247422049454336313936362D322E31000000
            000000000000000012735247422049454336313936362D322E31000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000058595A20000000000000F35100010000000116CC
            58595A200000000000000000000000000000000058595A200000000000006FA2
            000038F50000039058595A2000000000000062990000B785000018DA58595A20
            00000000000024A000000F840000B6CF64657363000000000000001649454320
            687474703A2F2F7777772E6965632E6368000000000000000000000016494543
            20687474703A2F2F7777772E6965632E63680000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            64657363000000000000002E4945432036313936362D322E312044656661756C
            742052474220636F6C6F7572207370616365202D207352474200000000000000
            000000002E4945432036313936362D322E312044656661756C74205247422063
            6F6C6F7572207370616365202D20735247420000000000000000000000000000
            000000000000000064657363000000000000002C5265666572656E6365205669
            6577696E6720436F6E646974696F6E20696E2049454336313936362D322E3100
            000000000000000000002C5265666572656E63652056696577696E6720436F6E
            646974696F6E20696E2049454336313936362D322E3100000000000000000000
            0000000000000000000000000000000076696577000000000013A4FE00145F2E
            0010CF140003EDCC0004130B00035C9E0000000158595A2000000000004C0956
            0050000000571FE76D6561730000000000000001000000000000000000000000
            000000000000028F000000027369672000000000435254206375727600000000
            0000040000000005000A000F00140019001E00230028002D00320037003B0040
            0045004A004F00540059005E00630068006D00720077007C00810086008B0090
            0095009A009F00A400A900AE00B200B700BC00C100C600CB00D000D500DB00E0
            00E500EB00F000F600FB01010107010D01130119011F0125012B01320138013E
            0145014C0152015901600167016E0175017C0183018B0192019A01A101A901B1
            01B901C101C901D101D901E101E901F201FA0203020C0214021D0226022F0238
            0241024B0254025D02670271027A0284028E029802A202AC02B602C102CB02D5
            02E002EB02F50300030B03160321032D03380343034F035A03660372037E038A
            039603A203AE03BA03C703D303E003EC03F9040604130420042D043B04480455
            04630471047E048C049A04A804B604C404D304E104F004FE050D051C052B053A
            05490558056705770586059605A605B505C505D505E505F60606061606270637
            06480659066A067B068C069D06AF06C006D106E306F507070719072B073D074F
            076107740786079907AC07BF07D207E507F8080B081F08320846085A086E0882
            089608AA08BE08D208E708FB09100925093A094F09640979098F09A409BA09CF
            09E509FB0A110A270A3D0A540A6A0A810A980AAE0AC50ADC0AF30B0B0B220B39
            0B510B690B800B980BB00BC80BE10BF90C120C2A0C430C5C0C750C8E0CA70CC0
            0CD90CF30D0D0D260D400D5A0D740D8E0DA90DC30DDE0DF80E130E2E0E490E64
            0E7F0E9B0EB60ED20EEE0F090F250F410F5E0F7A0F960FB30FCF0FEC10091026
            10431061107E109B10B910D710F511131131114F116D118C11AA11C911E81207
            122612451264128412A312C312E31303132313431363138313A413C513E51406
            14271449146A148B14AD14CE14F01512153415561578159B15BD15E016031626
            1649166C168F16B216D616FA171D17411765178917AE17D217F7181B18401865
            188A18AF18D518FA19201945196B199119B719DD1A041A2A1A511A771A9E1AC5
            1AEC1B141B3B1B631B8A1BB21BDA1C021C2A1C521C7B1CA31CCC1CF51D1E1D47
            1D701D991DC31DEC1E161E401E6A1E941EBE1EE91F131F3E1F691F941FBF1FEA
            20152041206C209820C420F0211C2148217521A121CE21FB22272255228222AF
            22DD230A23382366239423C223F0241F244D247C24AB24DA2509253825682597
            25C725F726272657268726B726E827182749277A27AB27DC280D283F287128A2
            28D429062938296B299D29D02A022A352A682A9B2ACF2B022B362B692B9D2BD1
            2C052C392C6E2CA22CD72D0C2D412D762DAB2DE12E162E4C2E822EB72EEE2F24
            2F5A2F912FC72FFE3035306C30A430DB3112314A318231BA31F2322A3263329B
            32D4330D3346337F33B833F1342B3465349E34D83513354D358735C235FD3637
            367236AE36E937243760379C37D738143850388C38C839053942397F39BC39F9
            3A363A743AB23AEF3B2D3B6B3BAA3BE83C273C653CA43CE33D223D613DA13DE0
            3E203E603EA03EE03F213F613FA23FE24023406440A640E74129416A41AC41EE
            4230427242B542F7433A437D43C044034447448A44CE45124555459A45DE4622
            466746AB46F04735477B47C04805484B489148D7491D496349A949F04A374A7D
            4AC44B0C4B534B9A4BE24C2A4C724CBA4D024D4A4D934DDC4E254E6E4EB74F00
            4F494F934FDD5027507150BB51065150519B51E65231527C52C75313535F53AA
            53F65442548F54DB5528557555C2560F565C56A956F75744579257E0582F587D
            58CB591A596959B85A075A565AA65AF55B455B955BE55C355C865CD65D275D78
            5DC95E1A5E6C5EBD5F0F5F615FB36005605760AA60FC614F61A261F56249629C
            62F06343639763EB6440649464E9653D659265E7663D669266E8673D679367E9
            683F689668EC6943699A69F16A486A9F6AF76B4F6BA76BFF6C576CAF6D086D60
            6DB96E126E6B6EC46F1E6F786FD1702B708670E0713A719571F0724B72A67301
            735D73B87414747074CC7528758575E1763E769B76F8775677B37811786E78CC
            792A798979E77A467AA57B047B637BC27C217C817CE17D417DA17E017E627EC2
            7F237F847FE5804780A8810A816B81CD8230829282F4835783BA841D848084E3
            854785AB860E867286D7873B879F8804886988CE8933899989FE8A648ACA8B30
            8B968BFC8C638CCA8D318D988DFF8E668ECE8F368F9E9006906E90D6913F91A8
            9211927A92E3934D93B69420948A94F4955F95C99634969F970A977597E0984C
            98B89924999099FC9A689AD59B429BAF9C1C9C899CF79D649DD29E409EAE9F1D
            9F8B9FFAA069A0D8A147A1B6A226A296A306A376A3E6A456A4C7A538A5A9A61A
            A68BA6FDA76EA7E0A852A8C4A937A9A9AA1CAA8FAB02AB75ABE9AC5CACD0AD44
            ADB8AE2DAEA1AF16AF8BB000B075B0EAB160B1D6B24BB2C2B338B3AEB425B49C
            B513B58AB601B679B6F0B768B7E0B859B8D1B94AB9C2BA3BBAB5BB2EBBA7BC21
            BC9BBD15BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC167C1E3C25FC2DBC358C3D4
            C451C4CEC54BC5C8C646C6C3C741C7BFC83DC8BCC93AC9B9CA38CAB7CB36CBB6
            CC35CCB5CD35CDB5CE36CEB6CF37CFB8D039D0BAD13CD1BED23FD2C1D344D3C6
            D449D4CBD54ED5D1D655D6D8D75CD7E0D864D8E8D96CD9F1DA76DAFBDB80DC05
            DC8ADD10DD96DE1CDEA2DF29DFAFE036E0BDE144E1CCE253E2DBE363E3EBE473
            E4FCE584E60DE696E71FE7A9E832E8BCE946E9D0EA5BEAE5EB70EBFBEC86ED11
            ED9CEE28EEB4EF40EFCCF058F0E5F172F1FFF28CF319F3A7F434F4C2F550F5DE
            F66DF6FBF78AF819F8A8F938F9C7FA57FAE7FB77FC07FC98FD29FDBAFE4BFEDC
            FF6DFFFFFFDB0043000202020202020202020203020202030403020203040504
            040404040506050505050505060607070807070609090A0A09090C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0CFFDB004301030303050405090606090D0A090A0D0F0E0E
            0E0E0F0F0C0C0C0C0C0F0F0C0C0C0C0C0C0F0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110801600109030111000211010311
            01FFC4001F000000070101010101000000000000000004050302060100070809
            0A0BFFC400B51000020103030204020607030402060273010203110400052112
            314151061361227181143291A10715B14223C152D1E1331662F0247282F12543
            345392A2B26373C235442793A3B33617546474C3D2E2082683090A1819849445
            46A4B456D355281AF2E3F3C4D4E4F465758595A5B5C5D5E5F566768696A6B6C6
            D6E6F637475767778797A7B7C7D7E7F738485868788898A8B8C8D8E8F8293949
            5969798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACADAEAFAFFC4001F010002
            0203010101010100000000000000010002030405060708090A0BFFC400B51100
            02020102030505040506040803036D0100021103042112314105511361220671
            819132A1B1F014C1D1E1234215526272F1332434438216925325A263B2C20773
            D235E2448317549308090A18192636451A2764745537F2A3B3C32829D3E3F384
            94A4B4C4D4E4F465758595A5B5C5D5E5F5465666768696A6B6C6D6E6F6475767
            778797A7B7C7D7E7F738485868788898A8B8C8D8E8F839495969798999A9B9C9
            D9E9F92A3A4A5A6A7A8A9AAABACADAEAFAFFDD00040022FFDA000C0301000211
            0311003F00FBEB34D15BC52CF3CA90C10A3492CB230544451566663B0006E49C
            55F0CDC7E767E70FFCE436B9A9F977FE716E3D3FCAFF00973A25E4961E62FF00
            9C8BF305B7D6EDAE2E223C6583CBDA73711766320833487D3AFD05954DE2FF00
            9C39BCD4E35B8F3B7FCE4E7E747997596DE6BEB2F312E916D53D445676B0148D
            6BD00271554FFA126F2D7FE5FAFCF1FF00C2D67FFAA18ABBFE849BCB5FF97EBF
            3C7FF0B59FFEA862AEFF00A126F2D7FE5FAFCF1FFC2D67FF00AA18ABBFE849BC
            B5FF0097EBF3C7FF000B59FF00EA862AEFFA126F2D7FE5FAFCF1FF00C2D67FFA
            A18ABBFE849BCB5FF97EBF3C7FF0B59FFEA862AEFF00A126F2D7FE5FAFCF1FFC
            2D67FF00AA18ABBFE849BCB5FF0097EBF3C7FF000B59FF00EA862AEFFA126F2D
            7FE5FAFCF1FF00C2D67FFAA18ABBFE849BCB5FF97EBF3C7FF0B59FFEA862AEFF
            00A126F2D7FE5FAFCF1FFC2D67FF00AA18ABBFE849BCB5FF0097EBF3C7FF000B
            59FF00EA862AEFFA126F2D7FE5FAFCF1FF00C2D67FFAA18ABBFE849BCB5FF97E
            BF3C7FF0B59FFEA862AEFF00A126F2D7FE5FAFCF1FFC2D67FF00AA18ABBFE849
            BCB5FF0097EBF3C7FF000B59FF00EA862AEFFA126F2D7FE5FAFCF1FF00C2D67F
            FAA18ABBFE849BCB5FF97EBF3C7FF0B59FFEA862AEFF00A126F2D7FE5FAFCF1F
            FC2D67FF00AA18ABBFE849BCB5FF0097EBF3C7FF000B59FF00EA862AEFFA126F
            2D7FE5FAFCF1FF00C2D67FFAA18ABBFE849BCB5FF97EBF3C7FF0B59FFEA862AE
            FF00A126F2D7FE5FAFCF1FFC2D67FF00AA18ABBFE849BCB5FF0097EBF3C7FF00
            0B59FF00EA862AEFFA126F2D7FE5FAFCF1FF00C2D67FFAA18ABBFE849BCB5FF9
            7EBF3C7FF0B59FFEA862AEFF00A126F2D7FE5FAFCF1FFC2D67FF00AA18AAC7FF
            009C344B1479FCAFFF003929F9DDA0EAE07FA3EA12F9ABEBF1A9EDCEDEE2DCA4
            83C41C5520B8FCD1FCF7FF009C62BCB6FF00A1819ADFF373F24E5952DDBF3CF4
            2B0FAA6ABA109184713EBFA643C91A1AD034F074AD5B91A2E2AFB934ED46C358
            B0B2D5B4ABD8751D3353B78EEB4FBFB6759219E09943C72C6EA48656520820D0
            8C5530C55FFFD0FA41FF003937AAEB9F9A3E75F23FFCE26F93B53B8D2BFE560D
            ACBE60FCE6F305992B369FE4EB3904724092282524D466A40A76DABD98E2AFAF
            3CB3E5AD03C9BA068FE56F2BE956FA1F97741B58EC747D26D5384304110E2A8A
            3F593B93B9249C5588FE727E64E9DF93DF95BE7AFCCDD5213756BE4DD267D416
            C81E26E2751C2DE007B1965644AFBE2ACCBCB9AED879A7CBBA0F99B4B93D5D33
            CC5A75AEA7A74837E505DC2B3467E95718AA798ABB15762AEC55D8ABB157CEFF
            00F3903FF3921E53FF009C76B3F27DD79A3CBDE61F32CDE77D4A5D2F44D3BCBB
            6B1DDDCB4F145EA9531BCB112586CA16A49ED8ABC1E2FF009F8B7E4FD95C5B2F
            9D3C83F999F975A75CCCB09D7BCC1E5A961B28B91A7291E39247007F9284FB62
            AFA37F34FF00E7207C85F959F94A3F3A6EDEE7CD7E4A9BEA0D6375E5FF0046E5
            AE63D46548A19622F2C6857E3049E5D3157B55ADC25DDB5BDD440FA7731A4B18
            6D8F1750C2A37DE8715792DD7E747966D3F3C34BFC8492C3523E6CD5BCAD2F9B
            6DF5158E2FD1EB670DC1B668DA432093D4E4B5002529DF1578079BFF00E73A7C
            8BE53F3F79D7F2F6DFF2B7F327CDFAA7902FD74FF30DFF0096F454D46D6391A3
            5954F28EE3900C18D39AA93438ABD4FF0024BFE729BF28BF3F2EF55D1BC99A95
            FE9BE6CD0D0CDAB792B5FB2934ED5608415532985F92BA866009466E269CA951
            55595EA1F9D7E59D37F3C340FC859F4FD49BCD9E63F2CDC79AACB5248E23A7AD
            A5B4CD034724865120909424008453BE2AF64C55E37F965F9D7E58FCD4F337E6
            BF95741D3F53B3BFFCA0F311F2D798E5BF8E248A7BA0A5B9DA98E590B27C2776
            0A7DB15497F3BFFE7257F2A3FE71FACF4F6F3F6B5336B7AD6DA0793F4984DEEA
            F7FF00170AC36A8410BCB6E6E5549D81AED8ABE757FF009CEDD66C201AE7983F
            E7133F38745F256D249E687D2164090F795E0AA9000DFED62AFABFF287F3B3F2
            D7F3CFCB3FE2AFCB4F32C3AFE9F0BAC3A95B71686F2C6765E5E8DD5B48049137
            5A5451A9552C37C55EB38ABB15762AEC55D8ABB15623E7BF36E9DE41F2579B3C
            EDAB1034DF2969179AB5E29609CD2CE1698A063B55F8F11EE7154BFF002BFCF7
            A7FE67FE5D7923F30F4B558ECBCE5A2D9EAC96EADCBD17B9895E4849A0A989CB
            21F718AB30BFB0B2D56C6EF4CD4ED21D434ED46092DAFEC6E116486786552924
            722302ACACA48208A118ABE20FC86FADFF00CE3EFE73F98BFE716751BB9AE3F2
            F7CC3613F9CBFE71E6EAE5D9DADAC84A7F4AE8218F2245A48DEAC409FEEC93DC
            62AFBB7157FFD1FA47FF0038CB0FF8D3F387FE72ABF39EECA5CC97DE751F97FE
            5AB91BFA7A5F9520485D63F0596E25673E2462AF58FCFCFCDAF3EFE4EF97479B
            7CADF93B7BF9B3A158C724BE634D27525B6BFB08D37F5BEA6D6B334D105A9668
            D8B2D2A538FC58ABF19FFE7293FE73E1FF00E722FF002CE3FCB9D1BC8173E48B
            3B9D5AD750D66FE6D4D2FBEB505A7364B6091C10D0194A39249FB34C559AFE40
            7FCFC7E4FCA4FCAAF257E56EAFF9557DE76D43CAD0B699A7EB16BAAA5BB5CC06
            6736B0881ADA662E88CB1800EF41418ABF63BF28BCE9E7AF3FF9521F3379EBF2
            C67FCA8BBBF60FA6F962FB515BED43EAE56A24BA448215B7627A464B30FDAE27
            6C55EAD8ABB15762AEC55D8ABE02FF009CCBFF00C9B5FF00383DFF009B7ADBFE
            4DA62AFB3FCF51793E6F27799A2F3FAD8B7925F4EB8FF147E93E3F54FA970265
            32F2DA807D35E9BE2AFC40B66D5CFF00CFADF5F17C6E5B444FCC0E3E49373CBF
            E39035987D3F4F97ECFADEB74DAB5C55FBB5A27FC71B48FF00982B7FF936B8AB
            E18D6FFF009249E4BFFCD2B7BFF75593154ABFE71B7CC3A0683FF391FF00F39C
            ADAE6B961A2ACFE72D09A037F7315B0709613F22BEAB2D40A8AD31563BAD6B5E
            56FCCBFF009F827E4F6B1F9437767E6297C87E55D647E7079B746E3716496F71
            0490D95ADCDD4558E4979380A39122A07EC90AAB33F35FFF002493F2B7FF0034
            E6A9FF007509F157DFD8ABF37BFE719BCC965E4DF3BFFCFC27CDDA8A96D3FCAF
            F987A86AD7C8A40668ACAD279DC027B90840C5511FF3847F96A7CF963A87FCE5
            E7E69C11798FF34BF372EEE2EFCB57176BEB2685A2C32BC16D6F62AF5111609F
            680A88F880455F92AFD19C55F32D87FCE317937CB9F9EABF9EDE44D5AFFC85AB
            EA966F65E78F28E9290268FAF07A912DD5B94F8650D46E5191565E5D4B9655F4
            D62AEC55D8ABB15762AF19FCEBFCC2F3DFE597954F9AFC95F95375F9B2961CDF
            5DD0F4ED452CB5086DD403EB5BC0F6F37D669BF24521C0DD55B7A2AFC6CFF9C8
            EFF9F8949F9E1F94FE62FCAED17F2D6EFC90FE639ADA1D6756B8D523BB3F55B6
            9D669AD844B6D0B2B48D1AA924EC390237C5507FF38D1FF3F096FC83FCA9D2FF
            002C75AFCB9BBF3B2E857B74FA36A90EAB1D988ED2EE5F596DBD27B79492923B
            D083B820536C55FB2BF91BF997E7CFCD6F2B2F9BBCDFF94B75F94B65A8AA4BE5
            FD3353D496EF50BA81813EB4D6C96F09B753B710E7991B95514AAAF15FF9CD48
            FF00C2FA3FE4DFE76DA230D4FF0026BF31B46BAB8B8534AE91ACCCBA66A70B11
            BF191264AFFAB8ABEDAA8F1C55FFD2FA4BFF003817F1FE4CF99EE9B79AF7F32B
            CE93DC39EACE75799493F428C55F6BE2AFE6EBFE7263C8773F9CFF00F3989F98
            3E45FC84F204775776173169FA9D8E93125B5BB6A16C83F48DF5DB92B0C0BEBB
            18D9D8A8256BBB935559D7FCE0068967E40FF9CB0BBFCBFF00CD7F23AE9DE78F
            D1179179663D6A002E74CD52D089CC96E1EABFBEB75938C8B5A80383509AAAFE
            82F15762AEC55D8ABB15762AFCDAFF009CFEF2D8F38F9ABFE7123CA4757BED03
            FC4DF995FA33F4EE9727A37D67F598113D7B6937E12256AA7B1C553B1FF3EEDF
            216AF24317E60FE71FE6A7E6468B0C8B21F2E6B3E6026CE52A6B4955230C47FA
            ACA7DF155FFF0039F7E59D1FCADFF3869AF797BCAFA441A2F97BCB775E5F834F
            D2ECE3E105ADAC3A8408A1547402A2A4EE4EE77C55F77E81224BA168B2C6C1E3
            92C2D9A371D0A9894823157C31A9CD1DD7FCFC9BCB715BB7A8FA5FE4B5C8BF03
            FDD665D4DCA72F98231578FF00E58FFCE3CFE4DFE7B7FCE4AFFCE664FF009AFE
            4A83CDF2F963CE1A445A134D75796DF574BBB291A603EAB3C3CB91897ED57A6D
            8AACFCD7FCA4D23FE7097CF3F94DF9B5F911A8EA7E5DF2979CBCEBA67943F323
            F2CE5BD96EB4FBFB5D44B88E4896732387882BF12598A9A1523E20CABD93CD7F
            FC924FCADFFCD39AA7FDD427C55F7F62AFCB9FC96F2B5CF9DEF7FE7E59E4FB00
            5AFF00CCFE72D674CB05A85ADC5CE9F731C42A7B1722B8ABDB3FE7DFBE76D37C
            D5FF0038C7E44D0E07F47CC1F972B3F95BCD9A43D166B4BBB299F82C895E439C
            4C8C091D6A3B1C55F6D62A944FAE68B69A959E8D75ABD95B6B1A8A97D3F4A96E
            234B99D56B568A1660EE050D481DB154DF15762AEC55D8ABB15762AFE797FE73
            7FCB11FE697FCE60DF7E5EFE4CF90E3D43CDD1D8595B79963D16101F50D5A753
            733DDDD95A468218658D6495E8050976AE2A937FCE227940FE517FCE63F95BF2
            FF00F3CBC830DA6B772B79A768F6DADC2264B4D50A7AB637F66D5686612189A3
            8E55E4B57AA90C010ABFA33C55F217FCE79A06FF009C4AFCE5246F158584B19F
            078F54B3753F4118AB2CFD3DAB7FCB649FF047157FFFD3FA4BFF003811FF0092
            475DFF00CD8BE73FFBAC4F8ABED4604AB0E5C4904061DBDF7C55E63F95BF93FE
            45FC9FD1EFF4AF25E95F579B5BBC9753F336BD72DEB6A3AADF4EED249737B724
            0691CB3B103655AD11546D8AADF3CFE4FF00913F30B5DF26F9B75CD2845E70F2
            06A306A5E51F36D9910EA168F0BF2683D5E279C1282C9244E0A90C760D460ABD
            4F15762AEC55D8ABB15762AF927FE723FF00297CEFF991F981FF0038C3E60F29
            D95ADDE97F95FF009850F987CE12DC5CA40F0D822A02F12302656A83F08DF157
            D6D8ABCDBF373F2D746FCE0FCB5F39FE5979865920D2FCE3A6C9613DDC403490
            48487867452402629555C0277A53157C43E4AD67FE73DFF25BCB763F96B75F93
            9E5CFCF0B2F2E44BA6794FF306D7CC1069AD35A42025BFD760B82AFF0002002A
            429A0DD98FC4557AA7FCE34FE46FE65797FCF3F987FF003901F9F3A869D71F9B
            FF0099B141A70D034763258687A3DB1568ACA29493CD8944AD090028F89D998E
            2AF2183C8DFF00398BF951F9DBFF003903E72FCA6FCB7F2579AFCB3F9B9E60B3
            D4EDAEFCC1ACB5BCC91595B1863E3142C8579191AA1ABD0531564DA5FE44FF00
            CE467E77FE63F903CF5FF3943ACF957CBFE4DFCB1D4D75DF2C7E53793FD6B88E
            E355869E84F7D75715E4A840340CDDD404E4C4AAAFF9F7F96DFF00391B07FCE4
            D7937F3CFF0023BC9FE5BF3647A079166F2CDCDBF98B53FA94426B9BC9E593F7
            685243C5190821A9B918ABD03F2CFCD9FF0039B1A979E342B2FCD7FCA9FCBDF2
            E7902669FF00C41ACE8BABCF737D085824687D189A570DCA608A6A3A138AA37F
            E71CBF297CEDF971F98DFF003943E63F35D95ADAE95F9A3E7E6F30793A5B7B94
            9DE6B128EA1E5451589AA47C277C5580FE65FF00CE337E657947F33757FCF9FF
            009C54F34E9FE56F397995849F983F96FAE2B9D03CC2E09633314A9866624926
            83E22583212DC95414DF9A9FF3F02BD84E9163FF0038C3E4ED1F5864E0DE65BB
            F34C13E9B196DBD55823944AC056BC79138AB35FC86FF9C62D77CA5E78D53F3D
            7F3CBCDF17E66FE7CEBD6CD6716AD0C5E9E99A0D9BD435A6951B052A0A9E25F8
            AEC4A85F89CBAAFB3715762AEC55D8ABB15762AF2BFCBCFC9FF237E59DDF9A75
            9F2F69824F3479E353B9D5FCE7E6FBBE32EA3A8DD5CCAD2B7AB3051C628F9718
            E240A88A05056A4AABFF0032BF283C8BF9AB1687279AB4AAEB3E54D46DB57F28
            79AACC88354D2AFAD2559A29AD2E402CBF128E486A8E366538ABD47157C8BFF3
            9E3FFAC91F9D3FF6CCB3FF00BA95A62A9962AFFFD4FA4BFF003811FF0092475D
            FF00CD8BE73FFBAC4F8ABED7C55D8ABB15762AA4EE912349232C691A96924620
            28502A4927A018ABF317F37BFE7E6DE40F27F992EFCA3F953E4DBBFCDBD42CA4
            6827D721B9369A6BCD19A3ADA9486E26B90A4105D51509DD5986F8ABC93FE8A8
            BF99BFFB0D52FF00D26EA1FF0078DC55DFF4544FCCBFFD86A9BFE93350FF00BC
            6E2AEFFA2A27E65FFEC354DFF499A87FDE371577FD1513F32FFF0061AA6FFA4C
            D43FEF1B8ABBFE8A89F997FF00B0D537FD266A1FF78DC55DFF004544FCCBFF00
            D86A9BFE93350FFBC6E2AEFF00A2A27E65FF00EC354DFF00499A87FDE371577F
            D1513F32FF00F61AA6FF00A4CD43FEF1B8ABBFE8A89F997FFB0D537FD266A1FF
            0078DC55DFF4544FCCBFFD86A9BFE93350FF00BC6E2AEFFA2A27E65FFEC354DF
            F499A87FDE371577FD1513F32FFF0061AA6FFA4CD43FEF1B8ABBFE8A89F997FF
            00B0D537FD266A1FF78DC55DFF004544FCCBFF00D86A9BFE93350FFBC6E2AEFF
            00A2A27E65FF00EC354DFF00499A87FDE371577FD1513F32FF00F61AA6FF00A4
            CD43FEF1B8ABBFE8A89F997FFB0D537FD266A1FF0078DC55DFF4544FCCBFFD86
            A9BFE93350FF00BC6E2AEFFA2A27E65FFEC354DFF499A87FDE3715665E44FF00
            9FA7797A7D7ED345FCDDFCA9D4FF002F6CEEDC03AFD9DC497CB6E8C40124D673
            5B5BCDE983F69A3E640FD9C55FAA5A26B7A4F99749D3B5FD0751B7D5F45D62DA
            3BBD2F54B4916582E2095432491BA920820E2A9B62AEC55D8ABB157C8BFF0039
            E3FF00AC91F9D3FF006CCB3FFBA95A62A9962AFF00FFD5FA4BFF003811FF0092
            475DFF00CD8BE73FFBAC4F8ABED7C55D8ABB15762AFCDEFF009F957E75EA9F97
            3F943A5FE5F7966EE5B4F317E6E5CCFA75CCD6CE5674D22D914DEA271F881B86
            96387DD59C62AF5EFF009C3FFF009C61F2D7FCE3EFE5CE8925DE8F6D2FE68798
            2D22BBF3AF98A48D5AE229A55E5F5081C8AC70DB86E1C54FC4C0BB56BB2AFB0F
            15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB1576
            2AEC55E23F9EFF0090FE45FCFF00F246A5E4FF003869D09BB785DBCBDE654894
            DEE977943E95C5BC9B35037DB4AF175AAB62AFCF9FF9F6EFE62F9A3CABE67FCC
            FF00F9C55F3E4CC350F20DCDDDF796EDA47A8B76B5BAFAB6A76B0F2DFD3323A4
            F181D3939EF8ABF5D315762AEC55D8ABE45FF9CF1FFD648FCE9FFB6659FF00DD
            4AD3154CB157FFD6FA4BFF003811FF0092475DFF00CD8BE73FFBAC4F8ABED7C5
            5D8ABB15762AFC6AFF009CE8B54F31FF00CE6B7FCE2B7952FCF3D2EE0687EA40
            775FF4BF30324BB7F94B02838ABF65715762AEC55D8ABB15762AEC55D8ABB157
            62AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB157E34D8411796FF00E7ED
            57B069CBE8C1AF5A4B2DEC6BB067BCF2CACD293F39220DF3C55FB2D8ABB15762
            AEC55F22FF00CE78FF00EB247E74FF00DB32CFFEEA5698AA658ABFFFD7FA4BFF
            003811FF0092475DFF00CD8BE73FFBAC4F8ABED7C55D8ABB15762AFC73FF009C
            C9FF00D6FDFF009C50F97967FF00122B9C55FB198ABB15762AEC55D8ABB15762
            AFCF4FF9CABFCFFF00CCFF00CADFCC3D27CBFE4CD5ED74ED2EE34286FA78A5B2
            86E5DA79279D0B73955881C500A0CC1D5679C2551EE7C97DBAF6BB5FD93AD8E1
            D348089803B8077248EBEE7CCDFF004397F9FBFF0053458FFDC2AD3FE68CC7FC
            CE5EF1F2788FF9393DB3FCF8FF00A58FEA77FD0E5FE7EFFD4D163FF70AB4FF00
            9A31FCCE5EF1F25FF9393DB3FCF8FF00A58FEA77FD0E57E7F7FD4D161FF70AB4
            FF009A31FCCE5EF1F25FF9393DB3FCF8FF00A58FEA7DC7ABFE75F9C93FE7146D
            BF376D4DA5AF9CAEACED819D220D02CADA82D9BCA217E43E25AB713B027C0666
            1CB2F078FAD3EA7AAF697531F67076846865311D36BE3E026BED7C39FF004397
            F9FBFF0053458FFDC2AD3FE68CC3FCCE5EF1F27CB3FE4E4F6CFF003E3FE963FA
            9DFF004397F9FBFF0053458FFDC2AD3FE68C7F3397BC7C97FE4E4F6CFF003E3F
            E963FA9DFF004397F9FBFF0053458FFDC2AD3FE68C7F3397BC7C97FE4E4F6CFF
            003E3FE963FA9DFF004397F9FBFF0053458FFDC2AD3FE68C7F3397BC7C97FE4E
            4F6CFF003E3FE963FA9DFF004397F9FBFF0053458FFDC2AD3FE68C7F3397BC7C
            97FE4E4F6CFF003E3FE963FA9DFF004397F9FBFF0053458FFDC2AD3FE68C7F33
            97BC7C97FE4E4F6CFF003E3FE963FA938D0FFE7363F3AF4DBE8A7D56E749F31D
            9023D7D3EE2C92DEABDF8C96FE9B29F026A3DB0C757901DE8B93A6FF0082776A
            E3983938271EE31AFB635FA5FA45F92FF9D9E59FCEBF2FDC6ADA2C32E99A9E97
            22C3ADE8172CAD35BBB8AA3065A078DC03C5A837041008CD861CC328B0FB37B3
            9ED269FB6F01C98AE3289A944F389FD20F42F6ACB5E89F8DFA8FFF0025BEC7FE
            D9F0FF00E22AD8ABF64315762AEC55D8ABE45FF9CF1FFD648FCE9FFB6659FF00
            DD4AD3154CB157FFD0FA4BFF003811FF0092475DFF00CD8BE73FFBAC4F8ABEB8
            F32798FCBFE51D1350F32F9A75AB3F2F681A44467D4F58D425482DE18C102AF2
            3900549000EA4D00DF157CD7E5EFF9CE3FF9C53F3479820F2CE95F9C9A49D4EE
            A616F686EE1BCB2B696463C42ADD5D41143B9D855E87B62AFACF15617E5EFCC0
            F2579B359F34797FCB1E65B1F306AFE4A9A0B7F355A58CA27FA8CF72AEF1452B
            A5503908D5506ABFB4062AFCA7FF009CC9FF00D6FDFF009C50F97967FF00122B
            9C55FB198ABB15762AEC55D8ABB15762AFC8CFF9CEFF00FC9BFA17FE0316DFF5
            15759ABD67F783DCFCFDFF00053FF8D287FC2C7FBA93E2ACC77CC5D8ABB157E9
            5EAFFF00AC01A57FCC3DAFFDD73330FF008B7C07DEFB7EABFE70B8FB87FD357E
            6A661BE20EC55D8ABB15762AEC55D8ABECEFF9C179644FCE3D4A2491D6393CB3
            79EAC6AC42BF1B8B623901B1A1E95CC8D17D7F07D3BFE059223B4E62F638CFDF
            17EBD66D1FA05F8DFA8FFF0025BEC7FED9F0FF00E22AD8ABF64062AEC55D8ABB
            157C8BFF0039E3FF00AC91F9D3FF006CCB3FFBA95A62A9962AFF00FFD1FA4BFF
            003811FF0092475DFF00CD8BE73FFBAC4F8ABCF3FE726345B7FCE6FF009CAFFF
            009C77FF009C7FF363CB73F966BA3EABE79F33F9752468E2D4EE6C7D48AD62B8
            E2416453191E3476A52B5C55F467E6AFFCE357E4B79FBF2CB5FF0025DF7E5D79
            7F4BB31A64E345BDD3B4EB7B49F4E9D226F467B6921446528C01A568C3660412
            3157C03F90DE51FF009CCBFCFAFC9FF227E5DEBFE66BBFC92FC9CD034F3A75FF
            009D95655F367996C959843142B2B07820584AC4AE7806515FDE8F87157E95FE
            4CFE45FE5A7E427961BCABF96DA0AE956B7322DC6B1A94CDEBDFEA370ABC7D7B
            CB861CA46A741B2AD4F1515C55F9A9FF003993FF00ADFBFF0038A1F2F2CFFE24
            5738ABF63315762AEC55D8ABB15762AEC55F919FF39DFF00F937F42FFC062DBF
            EA2AEB357ACFEF07B9F9FBFE0A7FF1A50FF858FF007527C5598EF98BB15762AF
            D2BD5FFF0058034AFF00987B5FFBAE6661FF0016F80FBDF6FD57FCE171F70FFA
            6AFCD4CC37C41D8ABB15762AEC55D8ABB157D95FF382DFF939EFBFF019BCFF00
            93F6D991A3FAFE0FA67FC0B3FE3525FF000B97DF17EBF66D1FA0DF8DFA8FFF00
            25BEC7FED9F0FF00E22AD8ABF64315762AEC55D8ABE45FF9CF1FFD648FCE9FFB
            6659FF00DD4AD3154CB157FFD2FA4BFF003811FF0092475DFF00CD8BE73FFBAC
            4F8AB19FF9C81FCB4FF9C886FF009C91FCBCFCF2FC8FF2AF96BCD07CA7E4CBCF
            2FDCDAF98F513670FAD7B7333BFC11957348DC104352B8AAEFF1B7FCFC73FF00
            2CB7E527FDC6EF3FEABE2AEFF1B7FCFC73FF002CB7E527FDC6EF3FEABE2AFA0B
            F23F59FF009C85D62D7CC6FF009FFE4EF2A7942F2DE7B75F2C43E56BD9AF1278
            591CDC35C195DF89560A169D457157E767FCE64FFEB7EFFCE287CBCB3FF8915C
            E2AFD8CC55D8ABB15762AEC55D8ABB157E467FCE77FF00E4DFD0BFF018B6FF00
            A8ABACD5EB3FBC1EE7E7EFF829FF00C6943FE163FDD49F15663BE62EC55D8ABF
            573CB1E45D6BF31FFE70A341F29F978C475ABED3CCD630CEDC1257B5D51EE0C5
            CFA29711955276A915A0DC6C21033D3803B9FA0B47D9797B4FD93869F1571CA3
            62FAF0CCCABE354F81CFFCE3CFE7874FF955DAF7FD238FF9AB30BC1C9FCD2F92
            7FA0DED8FF009469FC9AFF00A179FCF1FF00CB5FAFFF00D238FF009AB1F0727F
            34AFFA0DED8FF9469FC9DFF42F3F9E3FF96BF5FF00FA471FF3563E0E4FE695FF
            0041BDB1FF0028D3F9295CFE41FE7459DB5C5DDD7E5AEB96F6B6B13CB713C900
            0A91C6A59989E5D0015C1E0E4FE6944FD90ED6844CA5A7980059DBB9E400D771
            D0F4C83CCB7855D8ABECAFF9C16FFC9CF7DFF80CDE7FC9FB6CC8D1FD7F07D33F
            E059FF001A92FF0085CBEF8BF5FB368FD06FC6FD47FF0092DF63FF006CF87FF1
            156C55FB218ABB15762AEC55F22FFCE78FFEB247E74FFDB32CFF00EEA5698AA6
            58ABFFD3FA4BFF003811FF0092475DFF00CD8BE73FFBAC4F8AB3DFCEBFC93FCC
            EFCCDF31693AC7927FE7233CCFF937A75869DF52BBD0343B486E20BA9FD6793E
            B4ED2C8843F1609403A0C55E3FFF004295FF003903FF00B1D5F981FF0070CB4F
            FAAF8AA0AEFF00E7183FE72B3458BF48F937FE7373CC3A96B76DF1DAE9FE65D1
            AD66D3E561B85968F310A4EC7F76DF2C55E9FF00F38AFF009E3E77FCCC87F30F
            F2FBF37344B4D07F38FF0026F558748F3A45A7ED677B15C46CF697F6E0B3504C
            118903E1E8CB40DC5557C57FF3993FFADFBFF38A1F2F2CFF00E245738ABF6331
            5762AEC55D8ABB15762AEC55F919FF0039DFFF00937F42FF00C062DBFEA2AEB3
            57ACFEF07B9F9FBFE0A7FF001A50FF00858FF7527C5598EF98BB15762AFDC4FF
            009C56FF00C901F96BFF0030573FF519719B5D2FF751F73F527B0FFF0018DA7F
            EA9FF745F4265EF56EC55D8AB15F3C7FCA15E70FFB626A1FF50D26425C8B85DA
            5FE2B97FA92FB8BF9DE4FB2BF219A38F27E3F3CD7E4D8BB157D97FF382FF00F9
            3A2FFF00F019BCFF00A88B6CC8D1FD7F07D33FE059FF001A92FF0085CBEF8BF5
            F7368FD06FC6FD47FF0092DF63FF006CF87FF1156C55FB218ABB15762AEC55F2
            2FFCE78FFEB247E74FFDB32CFF00EEA5698AA658ABFFD4FA4BFF003811FF0092
            475DFF00CD8BE73FFBAC4F8ABDEFCFFF009EDF93BF959AA58E8BF98BF98DA279
            3756D42D7EBD63A7EA772B0CB2DB7368BD5553D579A915F118AB06FF00A1C5FF
            009C5DFF00CBEBE51FFA4F4FE98AA51AD7FCE6E7FCE2B687A75D6A53FE75F976
            F16DA3671696133DDDCCA40A848A18519999BA0DB15794FF00CE19AF98FF0031
            3CF7FF003901FF003931AC7976F7CADA07E716A7A659FE5FE997F1FA5713691A
            2C1240975221FF007EF25A11B121A848A12ABE75FF009CC9FF00D6FDFF009C50
            F97967FF00122B9C55FB198ABB15762AEC55D8ABB15762AFC8CFF9CEFF00FC9B
            FA17FE0316DFF515759ABD67F783DCFCFDFF00053FF8D287FC2C7FBA93E2ACC7
            7CC5D8ABB157EE27FCE2B7FE480FCB5FF982B9FF00A8CB8CDAE97FBA8FB9FA93
            D87FF8C6D3FF0054FF00BA2FA132F7AB762AEC558AF9E3FE50AF387FDB1350FF
            00A8693212E45C2ED2FF0015CBFD497DC5FCEF27D95F90CD1C793F1F9E6BF26C
            5D8ABECAFF009C16FF00C9CF7DFF0080CDE7FC9FB6CC8D1FD7F07D33FE059FF1
            A92FF85CBEF8BF5FB368FD06FC6FD47FF92DF63FF6CF87FF001156C55FB218AB
            B15762AEC55F22FF00CE78FF00EB247E74FF00DB32CFFEEA5698AA658ABFFFD5
            FA4BFF003811FF0092475DFF00CD8BE73FFBAC4F8AB20FF9CA6F387FCE3E7E5B
            68FA379BBF387F2DB49FCC8F346AAE745F227979F45B3D5B58D426AFA9F55B5F
            AC46C563567058D680B0A02CC14AAF8FEDBF39BF25FCB1A969127E7B7FCFBF23
            FC92F256B7751D9DBF9F352F2DE9D79656D24A689F5C45D3E1688776A72602BF
            09A62AFD17D17F247F222D4DA6B1A07E51F912069112E2C354B1D0B4D0595806
            492296383A1041041C55EBA0040154055514551B00062AFC76FF009CC9FF00D6
            FDFF009C50F97967FF00122B9C55FB198ABB15762AEC55D8ABB15762AFC8CFF9
            CEFF00FC9BFA17FE0316DFF515759ABD67F783DCFCFDFF00053FF8D287FC2C7F
            BA93E2ACC77CC5D8ABB157EE27FCE2B7FE480FCB5FF982B9FF00A8CB8CDAE97F
            BA8FB9FA93D87FF8C6D3FF0054FF00BA2FA132F7AB762AEC558AF9E3FE50AF38
            7FDB1350FF00A8693212E45C2ED2FF0015CBFD497DC5FCEF27D95F90CD1C793F
            1F9E6BF26C5D8ABECAFF009C16FF00C9CF7DFF0080CDE7FC9FB6CC8D1FD7F07D
            33FE059FF1A92FF85CBEF8BF5FB368FD06FC6FD47FF92DF63FF6CF87FF001156
            C55FAEBAFF00997CBDE54D2EE35BF346B961E5CD1AD29F5AD5B53B98AD2DA3AF
            4E52CCCAA2BEE71551F2B79B3CB5E77D034FF34F9435BB3F32797356577D335B
            D3E559EDA758E4689CC72254300E8C2A3B8C554754F3B793743D420D275AF366
            8DA3EA97201B7D36F6FEDEDEE1F974E314922B1AFB0C559357157C8DFF0039E3
            FF00AC91F9D3FF006CCB3FFBA95A62A9962AFF00FFD6FA4BFF003811FF009247
            5DFF00CD8BE73FFBAC4F8AB0CFCD2B6B5D63FE7E1BFF0038E761AB225CD8F97F
            F2FB5FD6B4CB79A8638EF4C93C42601B6E4A15483D4100F6C55F437FCE53697A
            3F983FE71C3F3BF4CD53D1B8B53E4CD5EE922765FEFECED9EEADD857BACB1211
            EE0531540FFCE23EB12EA7FF0038C9F91D797F7827BA6F2869D13C8EE0B71822
            1120249ECA8062AFA39248E404C6EAE06C4A907F562AFC77FF009CC9FF00D6FD
            FF009C50F97967FF00122B9C55FB198ABB15762AEC55D8ABB15762AFC8CFF9CE
            FF00FC9BFA17FE0316DFF515759ABD67F783DCFCFDFF00053FF8D287FC2C7FBA
            93E2ACC77CC5D8ABB157EE27FCE2B7FE480FCB5FF982B9FF00A8CB8CDAE97FBA
            8FB9FA93D87FF8C6D3FF0054FF00BA2FA132F7AB762AEC558AF9E3FE50AF387F
            DB1350FF00A8693212E45C2ED2FF0015CBFD497DC5FCEF27D95F90CD1C793F1F
            9E6BF26C5D8ABECAFF009C16FF00C9CF7DFF0080CDE7FC9FB6CC8D1FD7F07D33
            FE059FF1A92FF85CBEF8BF5FB368FD06FC6FD47FF92DF63FF6CF87FF001156C5
            5EADE7EF29E91FF3911FF39DF73F955F9AD2C9A97E5C7E527916D7CC9E5AF214
            92BC767AA6A3792C4B2DC4F1AB2FABC3D5A1A768C2FD9E60AAFB03F35BCDFE50
            FF009C69FC88F36F99B45D234FF2EE87E45D166FF0BF97ACE08EDED4DE4BC96C
            EDE28538AFEF6E241C82EFBB31C55F1F7E42FF00CE0E7E57FE607E55E97F985F
            F3909A0DD7E617E6CFE6BDA0F31798BCC5A8DF5D25C591D457D6822B6F465408
            6389D0EE0D1BE1FB202E2AF43FF9C21D475DD0752FF9C82FC89BFF0031DD79BB
            CBDF915E718F49F256B97D219AE574EBD85E54B392424D4DB98C8F6268282802
            ACFBFE73C7FF005923F3A7FED9967FF752B4C5532C55FFD7FA4BFF003811FF00
            92475DFF00CD8BE73FFBAC4F8AB3FF00CEAFF9C4EFC9DFCFBF31697E6CFCC6B0
            D56E357D0F4D3A5D8DC69FA9DC582ADAFAAF390CB0B2827939DCF6C55F9ABF98
            1E53FF009F61F90357B9F2F5D7993CD7E6CD62D1DA2BED3FCB3AAEADAB2C4CA6
            8CAF344DE81A1D880E7DF15641F953F95DFF003ED4FCDED5ADBCB3E55F32798F
            4CF335DB88AC7CAFAE6B3AAE9375339FB2902CECB1C8C4EC1518B1F0C55FA59F
            925FF38E9F969FF38FB6BE63B3FCB8B6D4ED60F34CF6F73ABAEA5A84F7E59ED5
            1923E06766E028E6A075C55F9D3FF3993FFADFBFF38A1F2F2CFF00E245738ABF
            63315762AEC55D8ABB15762AEC55F919FF0039DFFF00937F42FF00C062DBFEA2
            AEB357ACFEF07B9F9FBFE0A7FF001A50FF00858FF7527C5598EF98BB15762AFD
            7EFCADFCC5D2FF002A7FE7127CA3E75D5A33751E9BA7CD1D9E9AAE237BAB996F
            A748A05621A8589DCD0D00269B66C716418F0091EE7E8EEC3ED6C5D95ECDE2D4
            E4DC462687F38991A1F8E8F28FFA282DBFFE5AA97DFF00DCC2FF00D92653F9F9
            7F33ED79DFF93B70FF009463FE9FFE3AEFFA2835B7FE5AB97FEE30BFF6498FE7
            E5FCCFB57FE4EDC3FE518FFA7FF8EBBFE8A0D6DFF96AE5FF00B8C2FF00D9263F
            9F97F33ED5FF0093B70FF9463FE9FF00E3A91799BFE73C1F5CF2EEB9A358FE5A
            1B1BAD5ECA7B28AF27D53D68E3F5E3319731ADB465A81AB4E4301D7122B87ED7
            1B59FF0005419B04F1C74F465122CCEC0B15CB843F3D00A0007614CC31B3E3A5
            BC921D8ABECAFF009C16FF00C9CF7DFF0080CDE7FC9FB6CC8D1FD7F07D33FE05
            9FF1A92FF85CBEF8BF5FB368FD06FC6FD47FF92DF63FF6CF87FF001156C55F73
            7E7D7FCE3241F9B3E60F2CFE65792BCF1A97E52FE73F932092D7CBFE7ED2944C
            25B493916B3BEB66641345576A7C42819810CA78E2AF813F32348D1F59F3B797
            B47FF9CD2FF9CE1F29F9A7CAFE4FBE4BD7FCB2F2E58ADB7D6EE2062386A0962A
            4464EEADC90BF12554AF227157DE7ABF9CFC97FF003935E4693CA7FF0038F5FF
            00392167E4CD561B9825BAD6BCB220B8D521B0841592DD2D2778658438200900
            F869B62AF49FC8BFC8BF25FE407934F947CA06F2FA6BFBC9754F33F99B5497EB
            1A8EABA8CF4F52EAEA5A0A93401540000FF2AAC557977FCE78FF00EB247E74FF
            00DB32CFFEEA5698AA658ABFFFD0FA4BFF003811FF0092475DFF00CD8BE73FFB
            AC4F8AB1DFF9CBDD5FCD3F983E7AFC9DFF009C50F27EB971E584FCDF7BED57F3
            23CC166785CC3E5AD29394F042D5D8DC1E4A76DF885FB2CC0AAFA8BF2CFF0024
            BF2B3F27F42B2F2F7E5EF92B4BD02D2CE3546BB8EDD1EF2E180A192E2E981965
            76EE59BE541B62AC63F3A3FE71B3F29BF3CFCB77BA279BBCAD6306AB2233691E
            70B2B78E1D574EB900FA73C172815FE16DCA31E2DDC62AF32FF9C2EFCC4F3979
            9FC87E6FFCBAFCC9BE6D57F30FF223CD179E48F306B4C793DFC3674367752392
            793BC7F096FDAE218D4B1C55F1F7FCE64FFEB7EFFCE287CBCB3FF8915CE2AFD8
            CC55D8ABB15762AEC55D8ABB157E467FCE77FF00E4DFD0BFF018B6FF00A8ABAC
            D5EB3FBC1EE7E7EFF829FF00C6943FE163FDD49F15663BE62EC55D8ABEF9FCC1
            FF00D617FCA8F6D6A1A7FC8ED4732A7FE2F1F83EC1DB1FF387E9BFAC3EF9BE06
            CC57C7DD8ABB15762AEC55D8ABB157D95FF382DFF939EFBFF019BCFF0093F6D9
            91A3FAFE0FA67FC0B3FE3525FF000B97DF17EBF66D1FA0DF8DFA8FFF0025BEC7
            FED9F0FF00E22AD8ABE95FF9CA2F397E617E61FE65F937FE7123F28B5D93CA7A
            AF9DB4D935EFCD8F3D5B0ADC691E5A473118E02A54AC970C187504FC2BC80762
            157AFF00E59FFCE1DFFCE3B7E56E8F0699A37E5968DAE5E040B7DE62F315AC3A
            B6A17527ED4924B728E1493DA35551D862AF3EFCE7FF009C21FCB5F3940DE6DF
            CA5B387F253F39342ADE793FCEBE575FD1D10BC8C031A5DDBDB048DA37A71665
            50E2B5F885519566FF00F3897F9DFAE7E74FE5CDF2F9E6C5348FCD3FCBAD62E7
            CA9F997A52288D46A56242FD61506CA275F8A8360DC828E34C552BFF009CF1FF
            00D648FCE9FF00B6659FFDD4AD3154CB157FFFD1FA4BFF003811FF0092475DFF
            00CD8BE73FFBAC4F8ABCD7F39FCEFE50FCBEFF009CFAFC9BF3379E7CC761E56F
            2F5AFE55EB10C9ABEA732C16E934F7B32C6BCDB60CF42078E2AFA5FF00E86E7F
            E718FF00F2FA793BFEE270FF005C55DFF4373FF38C7FF97D3C9DFF0071387FAE
            2AF9EBFE70AF5FD17CD3F9BFFF0039A7E61F2DEAB6DADF97F59F3F69D79A46AB
            672096DEE2292CE4A491BAEC41A7518ABC0BFE7327FF005BF7FE7143E5E59FFC
            48AE7157EC662AEC55D8ABB15762AEC55D8ABF233FE73BFF00F26FE85FF80C5B
            7FD455D66AF59FDE0F73F3F7FC14FF00E34A1FF0B1FEEA4F8AB31DF31762AEC5
            5F7CFE617FEB0B7E54FF00DB6A0FF93DA8E654FF00C5E3F07D83B63FE70FD37F
            587DF37C0D98AF8FBB15762AEC55D8ABB15762AFB2BFE705BFF273DF7FE03379
            FF0027EDB32347F5FC1F4CFF008167FC6A4BFE172FBE2FD7ECDA3F41BF1BF51F
            FE4B7D8FFDB3E1FF00C455B157D19E5AB88BCB9FF3F1DFCC9B5D75BEAB3FE62F
            E5669537921E51FEF4269B3AADDC309EE4189DC8F053E1BAAFD03E4315757E8A
            E2AFCF9FF9C2EB887CC3F9AFFF0039A1E7BD1489BCA1E64FCC986D343D463A98
            6E66D360952EE58CF4218CA86A3AD6BE18ABD37FE73C7FF5923F3A7FED9967FF
            00752B4C5532C55FFFD2FA4BFF003811FF0092475DFF00CD8BE73FFBAC4F8ABD
            0FF30FFE85E3CDBF9C7E53FCABFCC8F2468BE6EFCCED73CBD73AAF96CEADA247
            7E174AB595FD551772C4EB18122B1085B73BD37C5525FCCBFCAAFF009C4DFCA5
            F23F983F313CEBF92FE4CB2F2BF95E04B9D66EEDFCB769732A46F2A42A5628A0
            2EDF1483A0C5592E89FF0038F9FF0038D1E61D1B49D7F4DFC90F2449A6EB9656
            FA869F23F97EC919A0B98D658CB2B43552558541E98AAAFE4AEA7F91435FFCD5
            F267E4D795F4CF2AEA7E40D660D2BF316D34BD2174B88DFF00A6E61F89238D67
            0A81A8C2A07D38ABF3DFFE7327FF005BF7FE7143E5E59FFC48AE7157EC662AEC
            55D8ABB15762AEC55D8ABF233FE73BFF00F26FE85FF80C5B7FD455D66AF59FDE
            0F73F3F7FC14FF00E34A1FF0B1FEEA4F8AB31DF31762AEC55F7EF9F629A5FF00
            9C17FCB068A3774B7D5E092E1D549089F58BF4E4C4741C980A9EE46654FF00C5
            E3F07D8BB5E265EC869E85D485FCE6F80B315F1D762AEC55D8ABB15762ABD11E
            4758E3569249182C51202CCCCC6800037249E80606718991000B25FACFFF0038
            8DFF0038FF00A9FE5C59DE79F3CE56B25979BBCC16C2DAC347938F2B1B162B29
            F5284D259595792EC500E2772C06CB4B80C059E67EC7E82F603D939F65E33A9D
            40ACB31423FCD8F3DFFA476B1D2AB9DBEDECCB7D29F8DFA8FF00F25BEC7FED9F
            0FFE22AD8ABEE7FF009C9BFF009C759BF3B34DF2CF98FC95E63FF01FE72FE5AD
            D36A3F96FE7940DC6295A85ED6EF802CD04A40AECDC4EFC482CACABE85F297F8
            887957CB1FE30307F8B7F4559FF8A3EA9FEF39D47D04FADFA34A0E1EAF2E34ED
            8ABC77FE724FCA5F9C1E7FFCBFB7F257E4DF996CFC9BA9F9A3548AC3CDBE6BBA
            AFA963A0C90CDF5C7B50BF1995D8222F1A1F88FC4BF682ACCFF26BF297CABF91
            FF00975E5CFCB6F27C2CBA568511F5EF650A6E2F2EA56E771753B281C9E49092
            7C0514515462AF18FF009CF1FF00D648FCE9FF00B6659FFDD4AD3154CB157FFF
            D3FA4BFF003811FF0092475DFF00CD8BE73FFBAC4F8AB15F3F48917FCFC67F23
            5E4758D07E54EBB576200FF7A6E3B9C559CFFCE7B5D5B49FF3887F9DE91DCC4E
            EDA3DB71457524FF00B90B5E801C55EFDF94F7768BF959F968AD750823CA9A30
            20C8BFF2C30FBE2AF92BFE7109837E7B7FCE7432B0656FCC8B32AC0D41FF0046
            9BA118ABE72FF9CC9FFD6FDFF9C50F97967FF122B9C55FB04934724B3429CBD4
            878FA954603E2151462006FA0ED8A048135DC8AC52EC55D8ABB15762AEC55F91
            9FF39DFF00F937F42FFC062DBFEA2AEB357ACFEF07B9F9FBFE0A7FF1A50FF858
            FF007527C5598EF98BB15762AFDA9FF9C78D0347F347FCE347923CBFAFE9F16A
            9A3EADA65D5BEA3613025248DAF67D8D0820822A08350771BE6D34F112C401E5
            4FD3BEC8E9B16A7B070E2CB11284A24107A8E22941FF009C2AFC892CCC349D59
            6A49E03529A82BD856BB0C87E531F77DAE29FF0081BF6313F44BFD3177FD094F
            E44FFD5AF56FFB894D8FE571FE0AFF00C9B6EC6FE64BFD3177FD094FE44FFD5A
            F56FFB894D8FE571FE0AFF00C9B6EC6FE64BFD3177FD094FE44FFD5AF56FFB89
            4D8FE571FE0AFF00C9B6EC6FE64BFD3177FD094FE44FFD5AF56FFB894D8FE571
            FE0AFF00C9B6EC6FE64BFD3177FD094FE44FFD5AF56FFB894D8FE571FE0AFF00
            C9B6EC6FE64BFD31647E4EFF009C56FC9DF23F9934BF3568BA35E49AB68D219B
            4E3797925C451CB42164F4DB62CB5AA93D0EFD7271D2C226C0E4E67677B0DD97
            A0CF1CF8A078E3B8B91201EFAFB9F49E643D83B157E37EA3FF00C96FB1FF00B6
            7C3FF88AB62AFB9FF393FE71A359FCD9F3847E6BB0FF009C80FCC7FCB4823D3A
            0B03E5BF2B6A7F54B02D0BCAE6E3D3A7F78E24A31F003157C65FF3931FF38EFE
            7BFC8CFC90F3D7E6A689FF003957F9BBADEA9E548ACE4B6D2AFF005C905B4DF5
            9BDB7B560E6228E2825E4287A8C55EC5A17FCE16F9AB57D1345D5A4FF9CBCFCE
            78A4D4EC6DEEE48975C3C55A7896420577A02C46FDB157D4BF921F939A8FE4E6
            8FADE95A87E6A79BBF355F58BE4BD8B52F37DE7D767B40B12C46181A838A371E
            4478E2AF34FF009CF1FF00D648FCE9FF00B6659FFDD4AD3154CB157FFFD4FA4B
            FF003811FF0092475DFF00CD8BE73FFBAC4F8AA1FF00E7273F2B3FE7127CF5E7
            2F2F6ABFF3903E74B3F2CF9AECB4636BA1DB4FE633A2C8FA7FD6247E62212A16
            1EAB30E5F476C55F381FF9C77FF9F68B02ADF9B3A73A9FB4ADE7C6607E60DC11
            8AB5FF0042F1FF003ED31B0FCDBD3D40E8079F1C01F47D63157D7FFF0038B5F9
            7DFF0038E1E42B0F3A47FF0038EFE67B5F33D9EAD7767279B65B6D6FF4D18A78
            A3916DC3B191CC7C9198D3BFD18ABE23FF009CC9FF00D6FDFF009C50F97967FF
            00122B9C55FB051DCC52CD716E8E4CB6A544E38914E6392EE450EDE18B112049
            1DC8AC593B15762AEC55D8ABB157E467FCE77FFE4DFD0BFF00018B6FFA8ABACD
            5EB3FBC1EE7E7EFF00829FFC6943FE163FDD49F15663BE62EC55D8ABF713FE71
            5BFF002407E5AFFCC15CFF00D465C66D74BFDD47DCFD49EC3FFC6369FF00AA7F
            DD148BFE7217FE723747FC99B04D274E8A2D6BCF7A94464D3B4A63586D633B09
            EF38B060A77E0A376A761BE4751A81847792E37B5BED861EC5C7C111C79A4368
            F41FD2979770EAFCC8BCFF009C92FCF3BDBBB9BC7FCC9D5ADDEE64691E0B668E
            185397ECC71AA00AA3B019AFF1F27F3BEE7C4B27B71DB139197E6242FBA80F80
            A437FD0C47E78FFE5D1D77FE472FFCD18F8F93F9C7ECFD4D5FE8D3B63FE5227F
            3FD8EFFA188FCF1FFCBA3AEFFC8E5FF9A31F1F27F38FD9FA97FD1A76C7FCA44F
            E7FB1DFF004311F9E3FF0097475DFF0091CBFF003463E3E4FE71FB3F52FF00A3
            4ED8FF009489FCFF0063BFE8623F3C7FF2E8EBBFF2397FE68C7C7C9FCE3F67EA
            5FF469DB1FF2913F9FEC77FD0C47E78FFE5D1D77FE472FFCD18F8F93F9C7ECFD
            4BFE8D3B63FE5227F3FD8FBD7FE70BBF34FCF3F9836DE7AD37CE5AE4DE611A1B
            D94FA75FDD50DC2FD6BD612465C01C97F740807A6F99BA4CB29D891BA7D63FE0
            6FDBDACED286686A67C7C062413CFD5763DDB3EECCCC7D39F8DFA8FF00F25BEC
            7FED9F0FFE22AD8ABF537CCFF9B9F957E49D4C68BE71FCC8F2C79575830A5C8D
            2B57D5ACECAE4C321609208A7951F8B14201A536C55F13FF00CE757E73FE5079
            B3FE715FF35FCBDE57FCD1F2A798F5ED4A0D352C346D3358B3BBB999A3D4ED25
            7091432BB1E28A58EDD062AFA57CA1FF003909F90F6FE53F2BDBCFF9D1E4786E
            20D22C639A0935FD3D5D1D60405595A7041046E08DB157AD794FCFBE47F3EDB5
            DDE791FCE1A2F9C2D2C25105F5D68B7F6F7F1C32950E1246B7770AC548343BE2
            AF9C7FE73C7FF5923F3A7FED9967FF00752B4C5532C55FFFD5FA4BFF003811FF
            0092475DFF00CD8BE73FFBAC4F8ABE80F3E7E487E507E67EA767ACFE61FE5D68
            5E72D574FB5FA958EA1AADA25C4B15BF3693D24661B2F36269E27157C55FF399
            DFF38E5F911E46FF009C61FCDEF35F93FF0029BCB3E5CF32E8DA5C12E95ADD85
            8450DCDBBB5EDBC65A37515525588FA7157B8F903FE714FF00E71B752F22F927
            51BFFC93F28DD5F5FE81A6DC5E5D49A6C45E4965B58DDDD891B96624938ABDDF
            C83F94FF0096DF95716A76FF00971E48D23C9706B72452EAD16936C96EB70F0A
            B2C6D20402A543103E78ABF2DFFE7327FF005BF7FE7143E5E59FFC48AE7157EC
            662AEC55D8ABB15762AEC55D8ABF233FE73BFF00F26FE85FF80C5B7FD455D66A
            F59FDE0F73F3F7FC14FF00E34A1FF0B1FEEA4F8AB31DF31762AEC55FB2FF0092
            1E6DD33C87FF0038A7E58F38EAE69A7F97F45BCBA9507DA9196F2711C4BD7E29
            1CAA8F739B2C3310C2247A07E96F6675F8F41ECEE2D464FA61091FF6476F89D9
            F909E64F30EB1E6DD7354F326BF7925FEAFACDC3DCDE5C4A6A4B39AF11D00551
            B2802800A0CD5C8991E23CCBF3BF686B72EB73CF36537291B27F1D3B923C9382
            EC55D8ABB15762AEC55FA39FF3EFBFF7A7F34BFD4D27F5DD666687F8BE0FB4FF
            00C08FFE44FF0099FEF9FA599B07D99F8DFA8FFF0025BEC7FED9F0FF00E22AD8
            ABF42FF38BF28BFE71C35C4D4FF33FF3B7C95E55BE8F40D3963D4FCDFAFC287D
            0B28199923691C8D83C842AF52CC00049A62AFCE01E6DFF9C64F375DDCBFE43F
            FCFBE756FCE5D06CA4689BCDB69A4AE9961232923F70F2472B106869C829F118
            AB20F25F99BFE7092EFCD761E43FCE8FF9C4987FE71E3CD9ABBAC5A4C5E70D25
            23D36E19E9C42DF52355A920067455DFED62AFD40FCBCFCA9FCB7FCA8B2D474D
            FCB6F26697E4BD3F57B85BBD4AD74B844293CEA8104AE17A9E200AE2AF09FF00
            9CF1FF00D648FCE9FF00B6659FFDD4AD3154CB157FFFD6FA4BFF003811FF0092
            475DFF00CD8BE73FFBAC4F8AB3AFCECFF9C9DD13F23FCC5A4F97353FCB3F3FF9
            DA6D5F4EFD249A8F94B471A8DA42BEB3C3E94B219A3E32550B71A7420E2AF897
            FE726BFE72D34FFCE9FC8AFCC6FCAFF2CFE46FE6D69FAEF9BEC21B5D3AF353F2
            D3C7691BC7750CE4CAD14D2B81C633D10EF8ABD53CA1FF0039DBE5AF2F7953CA
            FA05DFE437E724B77A26916361752C5E58AC6D2DB5BA44E50B5C0254B29A1206
            DD862AFAA7F237F3EF49FCF6B4F325DE97E44F38F918796AE2DEDE787CDFA60D
            364B93728CE1AD80964E6ABC0863B50D3157E76FFCE64FFEB7EFFCE287CBCB3F
            F8915CE2AFD8CC55D8ABB15762AEC55D8ABB157E467FCE77FF00E4DFD0BFF018
            B6FF00A8ABACD5EB3FBC1EE7E7EFF829FF00C6943FE163FDD49F15663BE62EC5
            5D8ABF505BFF005803FEDCC3FEEB59987FC57E0FBC9FF9C33FCCFF00A78FCBEC
            C37C19D8ABB15762AEC55D8ABB157E8E7FCFBEFF00DE9FCD2FF5349FD775999A
            1FE2F83ED3FF00023FF913FE67FBE7E9666C1F667E37EA3FFC96FB1FFB67C3FF
            0088AB62AF6EFCEAD19BFE725FFE72DBCADFF38F1AE4D31FCA1FCA5F2FC3E7AF
            CC5D06391A34D62FEE64F4EC6D66284131AABA1A56BC5A4A509042AFD12D374A
            D3B47D3ECF49D274FB6D2F4BD3E2582C34DB489218218D0515238E30AAAA3B00
            298AB06FCD4FCA6F22FE73F93755F237E60E8706B5A26A913223BAAFD66D2622
            89736B3105A2950EE187C8D56A0AAF987FE707BCD7E6C8FCBBF997F91BE7AD56
            4D7FCC9FF38EDE6993CA96FAFCB52F77A3BA97D35C96DCD1119457A2051DAB8A
            B2DFF9CF1FFD648FCE9FFB6659FF00DD4AD3154CB157FFD7FA4BFF003811FF00
            92475DFF00CD8BE73FFBAC4F8AB2BFCFEFF9C8DD53F2CBCCDE51FCAAFCB5F20D
            CFE6AFE74F9F2DE5BED0FCA51CEB676969A7C2C51EFAFEE9C111C5CD580FF558
            965A0E4ABD0F5CFCCFBCFCB1FC8FBAFCD4FCE4D3AD341D5FCB7A026A5E72D134
            998DC4097E5557EA7692B13CCBCCCB121268491534C55F1BF93BF373FE7E0FF9
            9BA0DAFE68793FF2B3F2EB44F26EB117D77CB1E4CD7AE2EE2D4EFAC9EA6193D6
            F590299168559C46185182F120955F51FF00CE38FF00CE40D9FE7CF9735F6BEF
            2E5D791BF30BC85A9B687F993E43BD3CE5D37504E54E0F45E7149C5B89201055
            948DAA557C03FF003993FF00ADFBFF0038A1F2F2CFFE245738ABF633157C45FF
            003943FF00390FE7AFC9AF33796746F2A59E917369AC69925EDD3EA304B2B875
            98C60298E68C0141E1989A8CF2C64015BBE6BEDC7B5DABEC4CF8E18230225124
            F1027AD7421F31FF00D0F5FE71FF00D5B7CB3FF48573FF0065798FF9C9F70786
            FF0093A7DA9FCCC5F297FC53BFE87AFF0038FF00EADBE59FFA42B9FF00B2BC7F
            393EE0BFF274FB53F998BE52FF008A6FFE87AFF38BFEAD7E59FF00A42B9FFB2B
            C7F393EE0BFF00274FB53F998BE52FF8A7E817FCE3C7E636BFF9A9F967A779BF
            CC9059C1AADCDE5DDBCA9631BC50F082528842BBC86B4EBBE66E9F21C91B2FAE
            FB25DB19BB5BB3E3A9CC0091321E9E5B1AEA4BDDB2E7A67E467FCE77FF00E4DF
            D0BFF018B6FF00A8ABACD5EB3FBC1EE7E7EFF829FF00C6943FE163FDD49F1566
            3BE62EC55D8ABF505BFF005803FEDCC3FEEB59987FC57E0FBC9FF9C33FCCFF00
            A78FCBECC37C19D8ABB156C02C42A82CCC68AA054927A00303200934198DB7E5
            CFE615EC297367E44F30DD41257D39E2D32ED91A9B1A308A8725E1CBB8FC9D9C
            7B0F5F3171C1908FEA4BF5223FE5587E657FE5BDF337FDC2AF3FEA963E1CFF00
            9A7E4CBF903B47FE51F27FA497EA77FCAB0FCCBFFCB79E66FF00B84DE7FD52C7
            C39FF34FC97F903B47FE51F27FA497EA7E8BFF00CE117E5CF9CBC9DA7F9E35CF
            3568175A05B7985AC21D26DEFA36B7B8945AFAE64730380EABFBD50A580AEF4D
            B33B458E51B2455BECBFF033EC6D5E87166C9A88180C9C3C225B4BD3766B98E7
            B77BEF7CCD7D4DF8DFA8FF00F25BEC7FED9F0FFE22AD8ABE80F336B167F91FFF
            0039E967E6FF0036CABA6F92BFE722FC996DE5AD37CC739E16B6DAFE91327A56
            D34876532C6102D4D2AE3C0D157E87D7E78AA51AFF0098344F2B68BAAF98FCC5
            A9DBE8DA16896D25E6ADAADD388E1820881677763D0003157C33FF00382F1DFF
            009C6E3FE720BFE720E7B19B4DD17F3D3CF0F77E4CB5B852923E91A42C96B6D7
            04114F8CC8EB51DD4FB5557A27FCE78FFEB247E74FFDB32CFF00EEA5698AA658
            ABFFD0FA4BFF003811FF0092475DFF00CD8BE73FFBAC4F8AB05FF9C8193CCFF9
            11FF003927E53FF9CA4B7F26EABE79FCB5BEF27C9E49FCC78B4480DDEA1A32AD
            D1B982FD2000563625549AD362091C96AABCA3F353F37ADBFE73B75AFCBFFC89
            FC9DF2EF989FF2E4F982CB5DFCE4F3CEA7A74D616B069B60C64FA927AB4E4D21
            3D0D0970816A3910ABF417F363F3A3F2ABFE71F3CADA7EB7F98BAF43E54D0E77
            FD1DA0DAC56F2CAD3CD142D225ADB436E8DF17A719E2361B7518ABE5AFF9C29D
            23CCFE6AF3A7FCE42FFCE46EB3E5ABDF27681F9DDAE58C9E46D0750430DCC9A7
            69B1CB1ADE4B11E9EAFA8B43DC8622AB42557CF7FF003993FF00ADFBFF0038A1
            F2F2CFFE245738ABF633157E567FCE7E7FCA7BE45FFB604DFF00516D9ACD6FD4
            3DC5F0CFF82CFF008D60FEA1FF0074F82B319F23762AEC55FB2DFF003859FF00
            921F47FF00B6AEA7FF005107363A3FEEFE27EF7E93FF0081BFFC6363FEB4BEF7
            D65996F78FC8CFF9CEFF00FC9BFA17FE0316DFF515759ABD67F783DCFCFDFF00
            053FF8D287FC2C7FBA93E2ACC77CC5D8ABB157EA0B7FEB007FDB987FDD6B330F
            F8AFC1F793FF003867F99FF4F1F97D986F833B15762AFB9BFE706BC83A2F98FC
            E9E63F386ABE9DC5D79221B61A3E9D22AB01717A651F59A357789622176D8B56
            B51995A38032323D1F57FF00816F6561D46AB26A67B9C40708F395FABE15B7BD
            FAC59B27DE1D8ABB15762AEC55F8DFA8FF00F25BEC7FED9F0FFE22AD8ABF507F
            373F28BC89F9E1E49D47C83F985A47E94D0F502B2C4F1B7A57369748088AEAD6
            6039452C7C8D0D3704AB065254AAFCEDD753FE722FFE71A18794741FF9CC8FCA
            CD73CB560163D1B43FCD69E3B5D6ED60E204711923324AEA8A00059E941F0AAF
            4C553AF2CFE497E617FCE574D677BF9F3FF393BE57FCC7FCB9D2668AEAE3F2BF
            F2AEE1174DB9954968D751B942B2501ECCACDD783275C55FA67A368FA5797B4B
            D3B42D0F4FB7D2746D22DA3B4D334DB541143041100B1C688B40A140A0C55F2C
            FF00CE78FF00EB247E74FF00DB32CFFEEA5698AA658ABFFFD1FA4BFF003811FF
            0092475DFF00CD8BE73FFBAC4F8AB15FF9CB6FF9CC2F397FCE38F9E7C9FE58D1
            BF2F74CD7F45F35695F5B6F356B37B3E9D656F77F59921FABBDC2C2F12D15439
            E4C08AF4A6F8AA07CB9F9FBFF399FE6BD22DF5CF28FF00CE35F913CC5A1DE0E5
            6BAAE97E7CD3EE6DE4E84D1E2622BBEE3AE2AAFA9F9F7FE73675B366759FF9C3
            7F23EAC74F9BEB163F5DF3669F71E8CD42BEA45EA06E0D424546F8ABE94FC94F
            35FE79F9A2DBCC527E76FE55E97F95F77653DBAF972DF4CD661D5C5EC4E8E677
            768BFBB28C14007AD7157E73FF00CE64FF00EB7EFF00CE287CBCB3FF008915CE
            2AFD8CC55F959FF39F9FF29EF917FED8137FD45366BB5BF50F717C33FE0B3FE3
            583FA87FDD3E0ACC47C8DD8ABB157ECAFF00CE15FF00E487D1FF00EDABA9FF00
            D441CD8E8FFBBF89FBDFA4FF00E06FFF0018D8FF00AD2FBDF59E65BDE3F233FE
            73BFFF0026FE85FF0080C5B7FD455D66AF59FDE0F73F3F7FC14FFE34A1FF000B
            1FEEA4F8AB31DF31762AEC55FA82DFFAC01FF6E61FF75ACCC3FE2BF07DE4FF00
            CE19FE67FD3C7E5F661BE0CEC55D8ABDA7F22BF37EF3F25FCEC3CCB1D89D534C
            BDB57B0D734C5608F2DBBB2C81A363B0747404576EA3BD725832F852BEF7AAF6
            53DA29761EAFC6E1E284870C87973DBCC11FA1FA4D07FCE6B7E45CD0472C9A96
            B16AF20ABDB4BA6CA5D3D98C65D7EE6399E3598CF5FB1F6887FC123B1A401339
            0F2313FA2C7DA985A7FCE657E42DCCDE93F992FACD7893EBDC69B74136EDF0C6
            C6A7B6D92FCE63EF6DC7FF00044EC599AF148F7C65FA9EBDE4AFCDDFCB6FCC32
            63F2779C74FD6AED579B69C8E62BA0B4A926DE6092D0773C6832DC79613E46DE
            87B3BB7B41DA3FE2D96333DD752FF4A68FD8F4BCB1DBBB157E37EA3FFC96FB1F
            FB67C3FF0088AB62AFA93FE7293F343F32357F3DF91BFE7173F22B531A07E63F
            E635A4BAB79B3CF20EFE5DF2F42CC925C4743512CA55C290430A00BF13AB2AA9
            EFE5FF00FCE047FCE36792F4E8D75AF23C3F993E64987A9ACF9BFCD8EFA8DE5E
            4EC3F7923248DE9254F40A95F1663BE2AC27F33FFE704BCA5605BF30BFE718EE
            EE3F23BF3874046B8D0EE746B8963D2EFDD4126D6F2D5999024C3E13C404DFE3
            4718ABDC3FE7163F3CAE7F3DFF002CA3D6F5ED34681F981E55D4AE7CB7F993E5
            DA01F54D62C4F19782D49549010C01E952B53C7962AC6BFE73C7FF005923F3A7
            FED9967FF752B4C5532C55FFD2FA4BFF003811FF0092475DFF00CD8BE73FFBAC
            4F8ABEC3D5F46D1FCC1A7DC693AF69567AD69578BC2EF4CBF823B9B7957C1E29
            559587CC62AF8C7CC5FF003835E45D3F55B8F35FE4279C3CC5FF0038E9E7294F
            37B9F2ADCBBE9170DB922EB499DCC2EA4D2AAA5453B62A921FCD0FF9CC5FC8E0
            EBF9B5F95D61FF003901E4BB5DE4F3FF00E5D916BAC4510DDA5BAD1A6A07E2A0
            93E88551FCD8ABE8FF00C93FF9C83FCB0FF9C82D1351D6BF2DF599EF8E892450
            F98748BDB696D2F74F9A60CD1C7711C838D582120A332EDD7157E70FFCE64FFE
            B7EFFCE287CBCB3FF8915CE2AFD8CC55F959FF0039F9FF0029EF917FED8137FD
            45366BB5BF50F717C33FE0B3FE3583FA87FDD3E0ACC47C8DD8ABB157ECAFFCE1
            5FFE487D1FFEDABA9FFD441CD8E8FF00BBF89FBDFA4FFE06FF00F18D8FFAD2FB
            DF59E65BDE3F233FE73BFF00F26FE85FF80C5B7FD455D66AF59FDE0F73F3F7FC
            14FF00E34A1FF0B1FEEA4F8AB31DF31762AEC55FA82DFF00AC01FF006E61FF00
            75ACCC3FE2BF07DE4FFCE19FE67FD3C7E5F661BE0CEC55D8ABB15762AEC551BA
            76A37FA46A167AA69777369FA95848B3D95F5BBB472C5221AAB23A904107C321
            C8D8E6E460D464C131931C8C6513608E60BF707FE71D3F33AFFF0035FF002C34
            8F326AF184D72D25974CD6A5450893DC5B05E53A2AECA24575620000354014A6
            6E7065F1217D5FA83D92EDA9F6B767C33CC7AC13197991D7E3CDEF5973D3BF1B
            F51FFE4B7D8FFDB3E1FF00C455B157D1FE5231691FF3F1CFCD58F59610DD79AF
            F2A74797C98F29FEFEDAD6E634BC486BD692445881FCA4E2AFD00A8DBDFA62AD
            721FDB8ABF3FFF00E70E678354FCE7FF009CDBF30E8CC25F2B6A7F9916D6DA65
            D4479412DE595BCCB7EF1B0241E4EEA491B1DB157A47FCE78FFEB247E74FFDB3
            2CFF00EEA5698AA658ABFFD3FA4BFF003811FF0092475DFF00CD8BE73FFBAC4F
            8ABE9DF3DFE65FE5FF00E5869126BDF985E71D27C9FA546A585D6A7751C064E3
            D562463CE46FF25013ED8ABE419FFE731BCE1F9A13CDA57FCE2A7E486B9F9A0B
            C8C4BF991E6256D07CAD13027E359AE384B70B415E2BC18F6C55497FE7167F3A
            3F384C779FF3941F9F5A8DEE91290F27E53FE5E73D0F4451D447717429717205
            6879007C1B157D67F96BF947F96DF93FA2C9A07E5A793F4FF28E973BACB78966
            84CB71220E2AF713C85E59980D81762462AFCBDFF9CC9FFD6FDFF9C50F97967F
            F122B9C55FB198ABF2B3FE73F3FE53DF22FF00DB026FFA8A6CD76B7EA1EE2F86
            7FC167FC6B07F50FFBA7C15988F91BB15762AFD95FF9C2BFFC90FA3FFDB5753F
            FA8839B1D1FF0077F13F7BF49FFC0DFF00E31B1FF5A5F7BEB3CCB7BC7E467FCE
            77FF00E4DFD0BFF018B6FF00A8ABACD5EB3FBC1EE7E7EFF829FF00C6943FE163
            FDD49F15663BE62EC55D8ABF505BFF005803FEDCC3FEEB59987FC57E0FBC9FF9
            C33FCCFF00A78FCBECC37C19D8ABB15762AEC55D8ABB157EBEFF00CE0BFF00E4
            95BAFF00C09750FF009356F9B1D17F77F12FD17FF030FF008C8FF9292FBA2FB2
            F32DF447E37EA3FF00C96FB1FF00B67C3FF88AB62AFB77FE7273F20BCC3F99AB
            E50FCC9FCAAD7A2F287E7B7E544F25EF90F5F987FA35E4320FF48D32F6A1AB0C
            C3605810096047176C55E35A77FCE786A5E4488687FF00391FF909E7BFCBCF37
            DA031DD5EE89A636ABA35E321A34B6970B203C09A5006900AFDB38AA4FE62FF9
            C98FCF0FF9C8DB797C87FF0038B7F957E63F2569FAE2FD5359FCF1F3A5A36976
            DA55B49F0CB259C5572D3015E2416607ECA568C157D9DF913F92FE59FC83FCB5
            D0BF2E3CAEF2DE41A773B9D5F5AB8149F51D46E086B9BC9454D0C8C36153C542
            AD4D2B8ABC9FFE73C7FF005923F3A7FED9967FF752B4C5532C55FFD4FA4BFF00
            3811FF0092475DFF00CD8BE73FFBAC4F8AA97FCE4A7FCE18E9DFF3917E7FF2A7
            E60CFF0098DA8792F52F28E9234BB0B7B4D3AD6F90917325C098FD64D03564A5
            3891B62AC763FF009C3EFCE88228E1B7FF009CDEFCCBB78215090C115B5A471A
            2A8A05545700003A0031542EA5FF0038ADF9B7A358DC6A7AC7FCE7A7E63695A6
            D927A979A8DE0B28208907ED492492AAA8F7271567DFF3895A968570DF99BA5E
            8DFF003939AC7FCE4BCBA35F69F1EA5AAEA48A60D26478E6A5BDACF18F4E5128
            5E4C51980A0DF157C7BFF3993FFADFBFF38A1F2F2CFF00E245738ABF633157E5
            67FCE7E7FCA7BE45FF00B604DFF514D9AED6FD43DC5F0CFF0082CFF8D60FEA1F
            F74F82B311F23762AEC55FB2BFF3857FF921F47FFB6AEA7FF5107363A3FEEFE2
            7EF7E93FF81BFF00C6363FEB4BEF7D67996F78FC8CFF009CEEFF00C9BDA17FE0
            316DFF00515759ABD67F783DCFCFDFF054FF008D287FC2C7FBA93E2ACC77CC5D
            8ABB157EC5FE50F936DBF307FE711BCBFE4BBA985BA798743BDB68AE695114DF
            5D9DA1908A1D9245563F2CD962871E011EF0FD27ECFF006747B43D9AC7A691A1
            38485F71E2347E069F913AE689AAF96B59D4B40D76D1F4FD63499DEDEFAD2552
            AC9221A1D8F507A83DC6F9AC20C4D1E6FCF1ADD165D1E6961CB131944D109561
            70DD8ABB15762AEC55D8ABF5F7FE705FFF0024ADD7FE04BA87FC9AB7CD8E8BFB
            BF897E8BFF008187FC647FC9497DD17D97996FA23F1BF51FFE4B7D8FFDB3E1FF
            00C455B157D0FF009C5F9AFF00F39377FF00F393ADF915F913AB793749860F24
            5BF9AA69BCD1653CA0937525BCA04B0331DFE0E2BC29D77F15558E85FF003F28
            A923CEBF9322A7FE58B51DBFE4962AEFD07FF3F29DFF00E775FC99F63F51D4BF
            EA9E2AFA4BF23ACBFE7202CB47D717FE720B57F296AFADBDFA9F2F49E5286E21
            852CC44A1967170AA4BFA95208ED8ABCDBFE73C7FF005923F3A7FED9967FF752
            B4C5532C55FFD5FA4BFF003811FF0092475DFF00CD8BE73FFBAC4F8ABD97F38B
            FE7233F27FF2220B53F98FE6F874BD535085A7D23CB56D1C977AA5E206E1582D
            2056720B7C219805AED5AE2AF9A5FF003EBFE72AFF003B6B07E407E468FCB5F2
            ADD9E307E697E68B1B673131F867B6D2622D236C2BBFA8BE23157847E54FE40D
            EFE7AFE7BFE76F947FE7297F3135DFCE397F2667D096CB4C8EEE6D3342B89B57
            B692EA61FA3EDD902A46542A842B5DCB7862AFD4FF00267907C93F975A3C7A07
            913CA9A5F947478E9FE81A55AC76C8C5450349E9805DA9FB4C49F7C55F947FF3
            993FFADFBFF38A1F2F2CFF00E245738ABF633157E567FCE7E7FCA7BE45FF00B6
            04DFF514D9AED6FD43DC5F0CFF0082CFF8D60FEA1FF74F82B311F23762AEC55F
            AD9FF3883E76F26687F929A4E9FAD79B746D1EFE3D4B5177B0BEBFB7B79955E7
            25498E5756A11B834CCFD2CE318512399FBDFA1BFE07DDA5A5C1D9108E4CB08C
            B8A5B190079F712FA726FCD2FCB48219A797F30BCB422B74696671AADA1E28A2
            A4D04A4E64F890EF1F37B5976DE80024E7C743FA71FD6FC6CFF9C8FF00CC1D2F
            F333F367CC1E64D0E76B9D0E24834ED22E9815F561B54E2655560AC15E42CCB5
            15A1DF3539F271CC91C9F9CFDB6ED7C7DA9DA73CB88DE3004627BC0EBEE26E9E
            1591790762AEC55FB89FF38ADFF9203F2D7FE60AE7FEA32E336BA5FEEA3EE7EA
            4F61FF00E31B4FFD53FEE8BD2BCD1F973E43F3B946F36794349F304B10A473DE
            5AC724AA28568252398143D2B96CE1197316EE75BD91A3D6D78F8A13AEF009F9
            F3799CDFF38ADF9033B995FF002DECD58800AC5737B1AEDE0A970A3F0CABF2D8
            BF9A1D34FD88EC699B3A78FC0C87DC50D2FF00CE277FCE3FCB14883F2F6188C8
            A544B1DF5F875A8A72526E08A8EDB63F95C7FCD6B3EC2762915F971FE9A5FF00
            14FCECFF009CA2FC89D27F263CC3A04DE5BBB9A7F2D79AA29DACAD2EDC493DB4
            F6A53D64E600E4844AA54915EA0D695CC0D46118CEDC8BE3DEDD7B2D8BB17342
            5809F0F20340EE626357EF1B8AF8BE59CA5E01D8ABB157EBEFFCE0BFFE495BAF
            FC09750FF9356F9B1D17F77F12FD17FF00030FF8C8FF009292FBA2FB2F32DF44
            7E37EA3FFC96FB1FFB67C3FF0088AB62AFB5A2FCA6F3BAFF00CE6A5D7E74B69F
            6C3F2FA5FCB48FCB49A97D693D73A92DF7AE63FAB7DBE3C37E5D3157D758ABB1
            56A98ABE46FF009CF1FF00D648FCE9FF00B6659FFDD4AD3154CB157FFFD6FA4B
            FF003811FF0092475DFF00CD8BE73FFBAC4F8AB38FCF2FF9C5CF2BFE74798FCB
            DF981079B3CC3F977F99FE4EB3367E54F3C797EE143DB47EAB4C164B6995A390
            06763B716DE9CA9B62AF1F7D7FFE7393F23D9BF4FF0096741FF9CA9F255A8F8B
            56F2FF001D0BCD2912FC20BD9B728277A50911AB31FE6C55E3BFF38BFF00F391
            3F96B73FF3929FF392DACF9C7556FCAAD47F33EE7CB52796BCB1E73034ABE693
            4FB29ADEEA27F5488D5924A000BD5811C6BBD157EAD452C53C51CD0C8B343328
            786642195D58543291B1046E08C55F8F5FF3993FFADFBFF38A1F2F2CFF00E245
            738ABF633157E567FCE7E7FCA7BE45FF00B604DFF514D9AED6FD43DC5F0CFF00
            82CFF8D60FEA1FF74F82B311F23762AEC55690A772A09F123234CACBB88FE51F
            70C1416CAEC9B1762AEC55D8ABF69FFE71EFCC3A4F953FE7197C99E64D76ED6C
            B48D1749BCBBD42E5AA78471DE5C13451B927A0037276CDA69C818813DCFD39E
            C9EAF1E93B030E6CA6A1084893E42458A7FD0F47E4AFFCB2799BFEE1F17FD94E
            57F9DC7E7F275A7FE0A1D93DD93FD28FF8A77FD0F4FE4B7FCB1F99BFEE1F17FD
            94E3F9DC7E7F25FF0093A1D93DD93FD28FF8A77FD0F4FE4B7FCB1F99BFEE1F17
            FD94E3F9DC7E7F25FF0093A1D93DD93FD28FF8A7C4FF00F3937F9F5A5FE766AD
            E5E87CBFA4DC69DA0F9592EBEA9777BC56EAE65BB31FA8CD1AB3AA22885788A9
            3D6BD8662EA330C845720F9AFB71ED662EDCC98E38624431DEE79932AE82E86C
            F96F297CFDD8ABB157EBEFFCE0BFFE495BAFFC09750FF9356F9B1D17F77F12FD
            17FF00030FF8C8FF009292FBA2FB2F32DF447E37EA3FFC96FB1FFB67C3FF0088
            AB62AFD8E1DFEEC55762AEC55D8ABE45FF009CF1FF00D648FCE9FF00B6659FFD
            D4AD3154CB157FFFD7FA4BFF003811FF0092475DFF00CD8BE73FFBAC4F8AB39F
            CEEFF9C943F92DE63D27CBDFF2A77CFF00F98BFA5B4DFD23FA57CA5A60BDB483
            F7CF0FA12B975E327C1CA9FCA41C55E35FF43EC7FF006173F3A7FF0009F5FF00
            AAB8ABCBFF00333FE727FF00257F33B4C367F9D1FF00386FF99BAB685121126A
            BA9F95A3796D63DC968AE1278E6880A924A3AE2AFA23FE70C7CB7F92FA679235
            FF0031FE41F9EF5FF347E5E79A6FA16B7F2C6B9792DCFF0087AF2D63227B38A2
            9C09202C2452CAD5AD15833020E2AF8FBFE7327FF5BF7FE7143E5E59FF00C48A
            E7157EC662AFCACFF9CFCFF94F7C8BFF006C09BFEA29B35DADFA87B8BE19FF00
            059FF1AC1FD43FEE9F056623E46EC55D8ABB15762AEC55D8ABB15762AFD416FF
            00D600FF00B730FF00BAD6661FF15F83EF27FE70CFF33FE9E3F2FB30DF06762A
            EC55D8ABB15762AEC55FAFBFF382FF00F9256EBFF025D43FE4D5BE6C745FDDFC
            4BF45FFC0C3FE323FE4A4BEE8BECBCCB7D11F8DFA8FF00F25BEC7FED9F0FFE22
            AD8ABF63D7A62ADE2AEC55C7157C8BFF0039E3FF00AC91F9D3FF006CCB3FFBA9
            5A62A9962AFF00FFD0FA4BFF003811FF0092475DFF00CD8BE73FFBAC4F8ABED7
            C55D8AB1AF34F9B3CB3E49D0EF7CCBE70F3058795F40D38037BACEA7711DB5BC
            7C8F1506490A8AB12001D49D86F8ABE03FF9C24D42C3CDFF009BDFF396BF995E
            40B37B3FC9BF37799B4D8FCA570206B7B6BEBFB486617D756D1B2AD0397566D8
            1F8D6A2BB055E29FF3993FFADFBFF38A1F2F2CFF00E245738ABF633157E667FC
            E7DF96750FD21E41F38AD1F4B36F71A34C02B5639C3FD610B35294752C077F84
            E6BF5B1E52F83E2FFF00058D14EF06A07D34607C8F31F3DFE4FCEACC37C61D8A
            BB15762AEC55D8ABB15762AD74C55FA99A8E9D7BA5FF00CE05FD4F51B692CEE4
            68504A609578B88EE35549A2620F4E48EAC3D8E66CC11A6A3DCFBEE6C33C5EC7
            F0CC107C3068F9CC11F617E5A6613E04EC55D8ABB15762AEC55D8ABF5F7FE705
            CD7F256EBFF025D43FE4D5BE6C745FDDFC4BF45FFC0C3FE323FE4A4BEE8BECBC
            CB7D11F8DFA8FF00F25BEC7FED9F0FFE22AD8ABF63C74C55BC55D8AB8F438ABE
            45FF009CF1FF00D648FCE9FF00B6659FFDD4AD3154CB157FFFD1FA4BFF003811
            FF0092475DFF00CD8BE73FFBAC4F8ABED7C55D8AB0FF003BF90FC9FF00993E5E
            B8F2A79EFCBD67E68F2E5E4B0CF75A35FA7A904925BC8B2C4CCBB578BA823154
            E343D0745F2CE9363A0F97349B3D0B44D313D2D3F48D3E14B6B6823A93C638A3
            0AAA2A49D875C55F917FF3993FFADFBFF38A1F2F2CFF00E245738ABF6331561F
            E74F26E81E7EF2CEA9E53F34590BFD1F568F8CD1D783A329E49244E375746019
            4F8FB6D919444851E4E0F68F67E1D7E0960CF1E28486FF00AC7711D1F907F9C9
            FF0038BBE7EFCB4D4353D4347D2EEBCD3E4584FAD69AF5AAAC93431310385D40
            879AB25402C1789EBB6E06AF2E9A50DC6E1F9F3DA4F6135BD9B394F0C4E4C3CC
            486E40EE90E7B77D5757CC351B8A80475198DC41E0CC487721E23EFC6C229BA8
            FE61F78C6C2D3AABFCC3EF18F104D3AA3F987DE31B08A7557F987DE31E209A75
            57F987DE31E20B4FA43FE71BBF25356FCD4F3B6917B79A4BCDE41D16ED67F31E
            A532B2DB4E2021FEA48E08E6F21A060A7E15A934DB3234F84E49035B07B8F62B
            D96CBDABAB8E4C90FDC40DC89E52AFE11DF7D7B83F4CBFE728E1A7FCE3EFE634
            3045410D85B718A35D9523BCB72680740AA2BEC333F542F14BDCFB57B6D1FF00
            5975000FE11FEE83F0FB356FCB6EC55D8ABB15762AEC5598791BC89E67FCC6F3
            159795FCA7A736A3AA5D9AB37D9860887DA9A79284222F727E42A6831840CCD0
            76BD93D8FA8ED4CE30608DC8FC80EF27A07EE07E4CFE5A5AFE52FE5F685E4C82
            75BCBBB457B8D62FD4305B8BD9CF399D436E141A2AFF00920577CDC62C7E1C40
            7E9FF67BB1A1D91A2869A26C8DE47BE4799FD03C83D632C776FC6FD47FF92DF6
            3FF6CF87FF001156C55FB1E3E8FA3156F15762AEC55F22FF00CE78FF00EB247E
            74FF00DB32CFFEEA5698AA658ABFFFD2FA4BFF003811FF0092475DFF00CD8BE7
            3FFBAC4F8ABED7C55D8ABB15762AFC73FF009CC9FF00D6FDFF009C50F97967FF
            00122B9C55FB198ABB15762AC1EE3F2E3F2F6E6696E6EFC89E5EB9B99DCC935C
            4BA5DA3BBBB1A9666688924F72723C11EE75D3EC8D14C994B0E324F32611FD4B
            7FE5587E5AFF00E5BDF2D7FDC26CFF00EA960E08F7047F23687FD431FF00A48F
            EA77FCAB0FCB5FFCB7BE5AFF00B84D9FFD52C7823DC17F91B43FEA18FF00D247
            F53BFE5587E5AFFE5BDF2D7FDC26CFFEA963C11EE0BFC8DA1FF50C7FE923FA9D
            FF002AC3F2D7FF002DEF96BFEE1367FF0054B1E08F705FE46D0FFA863FF491FD
            4EFF009561F96BFF0096F7CB5FF709B3FF00AA58F047B82FF23687FD431FFA48
            FEA77FCAB0FCB5FF00CB7BE5AFFB84D9FF00D52C7823DC17F91B43FEA18FFD24
            7F5329B0D3AC34BB382C34CB2834FB1B71C6DECADA358618C124D12340140A9A
            EC3260539D8F1431444600440E400A1F25D7B676BA85ADC58DEDB4577677713C
            17769320923962914ABA3A302195812083D70AE4C71C9131900411441E441E8F
            9B6EBFE70F7F20EEA796E3FC25716DEAB72FABC1A8DE24495EC8BEA9A0F6CC63
            A5C7DCF1D93FE07DD8B391978357DD2901F7A8FF00D09B7E41FF00D4B379FF00
            713BCFFAAB83F278FB9AFF00E4DD7627FA91FF004F2FD6EFFA135FC83FFA966F
            7FEE2779FF005571FCA63EE4FF00C9BAEC5FF523FE9E5FADDFF426DF907FF52C
            DE7FDC4EF3FEAAE3F93C7DC8FF009375D89FEA47FD3CBF5BBFE84D7F20FF00EA
            59BDFF00B89DE7FD55C7F298FB93FF0026EBB17FD48FFA797EB77FD09AFE41FF
            00D4B37BFF00713BCFFAAB8FE531F72FFC9BAEC5FF00523FE9E5FADED1E44FCB
            8F257E5AE92747F25E836FA359C8435D4A957B8B8715A34F3B9692422A69C8ED
            DA832EC78E3014053D2F65F64693B331785A680847AF79F793B9F8B3FC9BB376
            2AFC6FD47FF92DF63FF6CF87FF001156C55FB1E3156F15762AEC55F22FFCE78F
            FEB247E74FFDB32CFF00EEA5698AA658ABFFD3FA4BFF003811FF0092475DFF00
            CD8BE73FFBAC4F8ABED7C55D8ABB15762AFC6AFF009CE7B94F2EFF00CE6B7FCE
            2B79AAFF00F77A5C0342F5276D97FD13CC0EF2EFECB3A938ABF65715762AEC55
            D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8AB
            B157E3558CD1798FFE7ED5793E9CDEAC1A15A4915F48BB857B4F2C2C3283F292
            50BF3C55FB26A28298AAEC55D8ABB157C8BFF39E3FFAC91F9D3FF6CCB3FF00BA
            95A62A9962AFFFD4FA4BFF003811FF0092475DFF00CD8BE73FFBAC4F8ABED7C5
            5D8ABB15762AFCDBFF009F96FE4B6A9F987F945A57E61F96AD25BAF307E51DCC
            FA85E456C9CA76D1EE5145E489C7E226DDA28E6F655738ABD9FF00E710BFE726
            FCB5FF003907F971A30B8D5ADE2FCCDF2FD9436BE76F2F49228B879A2509F5F8
            50906486E29CC328A29250EE3755F5EE2AEC55D8ABB15762AEC55D8ABB15762A
            EC55D8ABB15762AEC55D8ABB15762AEC55D8ABC53F3D7F3D3C8DF903E47D4BCE
            7E72D46259A289D7CBFE5D49145EEAB79C7F776D6D1EEC7935393538A0F89B6C
            55F9E9FF003EDDFCBEF33F9BFCD7F9A7FF003955E7A849D43CF7757961E5C9DD
            28B70F7575F5AD4EE61AEE23591238108143C5C76C55FAED8ABB15762AEC55F2
            2FFCE78FFEB247E74FFDB32CFF00EEA5698AA658ABFFD5FA4BFF003811FF0092
            475DFF00CD8BE73FFBAC4F8ABED7C55D8ABB157C23ABFF00CE49FE7DF987CF1F
            98D6DF929F90569E7DFCBCFCA2D727F2EF9AF55BFD6574ED4F54D46C155EFE0D
            26165319688300BCC9E469D0B050ABEB3FCBDF3D797BF353C8DA079DFCBE2597
            42F33DA1916D2F2231CF0BAB3437369730B578CB04A8F148A7A32B0DF157E7AF
            E6EFFCFB1FC91E69F32DDF9BFF0028BCED77F94BA85E48D3CBA1476ED75A7473
            486AED68D14D6F35B2B75E0ACCA3A2851B055E51FF0044C2FCDCFF00D89793FE
            446A9FF791C55DFF0044C2FCDCFF00D89793FE446A9FF791C55DFF0044C2FCDC
            FF00D89793FE446A9FF791C55DFF0044C2FCDCFF00D89793FE446A9FF791C55D
            FF0044C2FCDCFF00D89793FE446A9FF791C55DFF0044C2FCDCFF00D89793FE44
            6A9FF791C55DFF0044C2FCDCFF00D89793FE446A9FF791C55DFF0044C2FCDCFF
            00D89793FE446A9FF791C55DFF0044C2FCDCFF00D89793FE446A9FF791C55DFF
            0044C2FCDCFF00D89793FE446A9FF791C55DFF0044C2FCDCFF00D89793FE446A
            9FF791C55DFF0044C2FCDCFF00D89793FE446A9FF791C55DFF0044C2FCDCFF00
            D89793FE446A9FF791C55DFF0044C2FCDCFF00D89793FE446A9FF791C55DFF00
            44C2FCDCFF00D89793FE446A9FF791C55DFF0044C2FCDCFF00D89793FE446A9F
            F791C55DFF0044C2FCDCFF00D89793FE446A9FF791C55DFF0044C2FCDCFF00D8
            9793FE446A9FF791C55DFF0044C2FCDCFF00D89793FE446A9FF791C5598791FF
            00E7D67A4AEBF69ACFE717E6DEA5E7FB2B36DF42B2825B4FAC20A111CD7B7173
            7330427ED2C61491FB43157EAAE85A1E91E59D1F4CF2F681A6DBE8FA1E8F6F1D
            9E95A55A462282DE08942A471A2EC0003154DF15762AEC55D8ABE45FF9CF1FFD
            648FCE9FFB6659FF00DD4AD3154CB157FFD6FA4BFF003811FF0092475DFF00CD
            8BE73FFBAC4F8ABE8FFCD4D4FF0032F47F266A3A97E52796B4AF3879DAD6480D
            8797358BB3616F751348AB328B91B23AA12CBCB634A77C55F097967FE7287FE7
            303CDBF993E73FCA6D27F223C883CE5F97F6106A1E6B825F31CC6D6D85D22BDB
            C1F5A891D1A69436CA3A6FC8AD31546790BFE723BFE7357F32F413E63F277FCE
            3AF92750D361BEBCD32F526F342DB5C5ADF584CD6F756D7104AC1E392391082A
            474A11B10715631F961F9FFF00F395DE66D57F3474CFCB7FF9C61F2145A8F95B
            CDB7765F9931C7E611660F983822DCC8CCE544CCCB1A8322D41A75C558F7E4CF
            E747FCE5E4FAFF00E76F967C81F909E50D5AFB40F3DDE5DF9D74AB9F310B78F4
            BD57538D25B8B7B791D82CC8F2C6F3165FDA76C55EEFFF002B3BFE7E11FF00B0
            C5E43FFC2B62FF00AA98AA0753FCE0FF009CFBD1B4DD4357D43FE71A7C890586
            956D35E5F4C3CD71B9486043248C156424D154EC315639F975FF00391FFF0039
            B3F9A9E4CD07F303C95FF38E7E48D57CA9E6781AE345BF93CCC2D5E48D247898
            B4333075F8908A118AA13C89FF003941FF003995F99771E73B5F277FCE3AF933
            519FC81AF5CF967CD51CDE65FAB7D5F53B4A7AD0A994A8902D7ED2D41C55917E
            5D7FCE4CFF00CE517993F3C2EFF277CCBF90DE5AB0BAF29AE9B7FF0098C74FF3
            02C93E9FA5EA7FDD5D5BB4AC219D9410C6356AD011D7157E8A62AF2FFCDCD5BF
            35343F27CDA97E4E794F48F3B79CA0BAB709E5CD66F4E9F0CF6AEDC6631DC6CA
            B22021806201008EB4C55F0C795BFE7287FE7337CE9E6AF3F7927CB9FF0038E7
            E4EBDF327E58DD5A59F9D2C9FCCA214B59AFA369ADD52591824BC9109AA12077
            C556E93FF3945FF3997ADFE62F9ABF2A34DFF9C73F26CFE7AF24D8596A7E64D2
            9BCCA12382DB5001AD9D6E19846E581DC292477C55BFCCAFF9CA2FF9CC9FCA3D
            2349D77CF7FF0038EDE4BD2B4CD735AB3F2FE9B3C3E65FAD17D43502CB6F1948
            4B150C54D58EC3BE2ACD754FCE0FF9CF5D1B4DD4757D43FE71A3C8F0D86956B3
            5E5F4C3CD91B9586043248C1558934553B0C558CFE5D7FCE487FCE6AFE6B7933
            41FCC1F23FFCE39F92B53F2A799A179F47BF9BCCE2D9E48D257858B4329575A3
            C6C28462AF40FF009C61FF009C8BFCF4FCEEF347996DBCDDF943A1F973C95E54
            D4B52F2E6BDE64D2F5813CD69AF69A632F6ED6D351A58C862BCE3A8AD3B57157
            DD38AB14F3BF9A2DFC91E4DF3679CAF2DA5BDB4F2968D7DACDCD9C1FDE4B1D8D
            BBDC3469B1A1609404E2AF913F243FE7277F31FCDB2FE52DDFE6CF91740F2A79
            77FE720A1BC9BF2AB52D0F529AEA6865B481AED2D7548678D406B8B75678DE27
            22ABC1914B0A2AC53F3ABFE7217FE72F3F25F4CF3D79CF57FC8BF25DEFE5AF93
            EE9CC7E6C8FCC0FEACF62F72B05B4E6C81332B3FA89C969B1AF6DF1548BCD9FF
            00392DFF0039A3E49F206A3F99DE64FF009C73F25D9F9334AD3A3D56F7528FCC
            C26916D650851C4084C849E63602B8AA9F97FF00E7273FE7317CD7E42FF959DE
            5BFC84F206B3E49FD1F3EA6DAC5B79B158A416C8D24EAF0922459230A4346CA1
            830A115C55DE4DFF009C9BFF009CCEF3F7E5EE9BF9A7E56FF9C75F25DF792B57
            D3E5D4EC35393CCDE848F6B0170EE609089011E9B6C4571563367FF3993FF395
            F7BF93527E7EDB7FCE3FF939FF002B63D3E7D51B5D3E61759BEAB6F335BC8FF5
            43FBEA89108A71A9EB8AA335AFF9CBBFF9CB9F2FDB7E56DDEABFF38F9E4D820F
            CE7BEB2D3BF2ED97CC4CE6F2E7518567B6590293E8064604992807438AA7FF00
            993FF392DFF39A5F949E4BD67F303CF7FF0038E7E4BD2BCABE5F10B6AB7F0F99
            85D3C627992DE3A4309676AC9228D862A9DEA1F9E5FF0039D3A5796AF7CDF7BF
            F38D7E488B40D3B4C9758BBBB1E6A4665B3861370EE230DC89118278815ED8AB
            DABFE715BF38FF00357F3C3C963CF5F983F975A6792F40D760B6BFF21EABA56A
            2B7A9A85A4BCD65F5A1722681D1D05032D083E23157D518ABE45FF009CF1FF00
            D648FCE9FF00B6659FFDD4AD3154CB157FFFD7FA49FF003815F07E4C799ED9B6
            9ACBF32BCE905C21EAAE35799A87E8618ABED8C55F9C3E6AF39FE4CD8F9DBF34
            FF00E7247F27BF3CB42F2279BFC9E7FC2FF9D3A1F986D669B46D6E4D35B8C292
            5A96B7BA5B8528638AE2D0B07E25783FC55559E7FCE0968DE7393F2F3CFF00F9
            A3E75D364F2F5DFE7AF9E754F3D695E5A60E896B65A808C4522249F1A89F8175
            E40129C18F5C552DFF009C323FF210FF00E734C7FE669D57FE238AA9FF00CE20
            FF00E4EBFF009CE4FF00CDA117FD433E2AF23FC88F287E717FCE458F3EFF00CE
            41EBBF9FBE71F216BF65E6BD5F4AF20F92743712689A5C5A35C7A4B0DF696E19
            6F118A9478A8AEE2AC5CBB7C2AA2BCA33FFCE537FCE41793FF00307F3A7CD3F9
            8B75F929E50D3F4DD5F4DF287E555868F14B0EA3158DB4B05EDD6A29A927AE12
            6955D5012245DC829C54BAAF64FF009C3BF35E9FE47FF9C17FCB2F38EA7677D7
            9A5F967CB1A86A57F69A65BBDE5DB416F7B76F208604F8A460A09A0C55F24FFC
            E2EFFCE5F7E577912FBF3FF56BFD0FCEBACD87E637E66EADE69F2F5C689E5FB9
            D454585F056845C3405962969B9426A3157B3FFCE30FE63687F9B1FF00399BFF
            003917E7AF2E58EADA6E91AAF92FCB115BD9EB963269D7CAD6BFB97325B4BF1A
            82CB5527A8DF157E9AE2AEC55F9F1E4DF317973FE71EBFE724FF00E728354FCE
            2D7EC7C89A07E6CCBE5FF317E5FF0099B55945B69DA8C1616935BDEDBC571251
            0DC5BBBAF286BCF890CA0AEF8AB15FF9C67FCCAF27FE6E7FCE6A7FCE4A79E7C8
            5AA1D6FCABA8794BCB769A76ADE9490A5C35952DE578D65556285D0F1240A8DF
            A62AF36FF9C9FF00CD6FCC0FCE5FCDBD23FE7142DBF28B50B1F30F967F32FCBD
            E67D0FCC905C7D62D6EFCBB65577BFB85F4D7D14FDE312FC8A8A143F18A155F7
            EFFCE4B7E687973F297F277CDDE64F3541A94BA55FDA4DA28974DB47BB6867D4
            609218249C291E9C5CC85676340481DF157C13FF00389BFF00398DF965F95FFF
            0038F1F95FE40F307963CFD7FACF96F4F9EDEFAF347F2CDE5FD8BBC9793CA0C3
            7310E32001C02477A8C55ED3FF003EF0D5ADB5FF0025FE7A6BF651CF0D96BBF9
            C1E62D46CE1BA8CC33A457496D2A2CD136E8E1580653B83B62AFD0AC550D716F
            05DC12DADD449736D728D15C5BCAA1E3923705591D58104106841EB8ABF167F3
            87CC1F955F91BFF3943F921E46F2441E7E5D0FF2C3CCF75AF6B3F96096B71A86
            9B66BA958130C9E58B67569DD6469A40F1C4E62521B82820E2AF67FF009CA8FF
            009C8AF2AFE707FCE2FF00E7D797B42F26F9EFCBB75A7F97EC6FE4BCF347972E
            F48B4745D62C63E11CF38E2D255AA17AD2A7157BFF00FCE4868FAAF983FE7087
            CFBA5E8B6136A7A94FF9756F241636EA5E57105BC1349C546E48446341BED8AB
            C2BCFF00A87973F293FE71E743FCE8F2879B747D32D3CFFF0097BA7699E7AF23
            5C5DA476BE6A7BAD263B38EF74E55E5C75380B00595489A35293538A488ABDA3
            FE70F74DB9D43FE7087F2CF48B3024BCBEF286A3676AAC42869649AEE34049D8
            02C7157CA706B7A3794FFE7D6FE68F24799755B4D13CE1E5BD0F59F2C6BBE57B
            C9922BFB5D63F4C4E059496EC4482521D580A6EA798F877C55E85F9C48F1683F
            F3ED38E5468E48FCEBE4E492360432B0D321041077041C55947FCFCA7F33FCB9
            E59FC84D6BF2D754B7D4C6BFF99F1C29E58BC8AD1DF4FF00534DBFB4BA9E3B8B
            AA848DCC4A59577269D29BE2A90F9AFF00E738BF29F53FC9EF327946DFCA5F98
            E9A8EA1E4DBCD220B99BCA97B1DA89A6D39E057798FC2B186352FD00DFA62AFA
            2FFE70814AFF00CE26FE45A9EABE5A8C1A7B4D2E2AFAAF157C85FF0039E6C17F
            E712BF39149DE6B0B08A31E2F26A9668A3E9271565BFA0357FF96193FE04E2AF
            FFD0FA47FF0038C930F25FE707FCE557E4BDD84B592C7CEA3F303CB36C363269
            7E6B8126768FC562B88990F8138ABED9C55F9FFF009FFF00F3887F97EBAADC7F
            CE417E5BFE5A69FE60FCD4F2C6ADFE29D67C9577CEE34EF352A12F7D6CF69333
            C51DD4885A4864451FBE0BCD5B91C55F62FE5AFE60F96FF353C8BE59FCC1F284
            D2CFE5EF34D92DE69DEBC4D0CD1EE5248658DB7578A456461D3929A1237C55F2
            EFFCE26F973CC5E5CFCC5FF9CC0FF106877DA28D6FF362F756D1A4BC81E25BCB
            1BB8F9C1730330E3246EBD1949F0EB8AADFF009C5BF2CF98FCBBF9D1FF003999
            36BDA15F68F0F983F306D754D06E2EE168E3BDB29ADA4F4EE2DDC8E3221A1155
            3B1D8D0E2ACA75AD2BCC1FF38E9E6CF38FE617943CB57BE70FC9EF3EDFB6BBF9
            91E4ED210CDAB681AC3AAA5D6B7A65A8DEEADEE5515AEADD3F78AE3D688302E9
            8ABDC35CD46D7CF5F957AE6A7E5577D62CFCD9E57BB9BCBCE91BC4F7297966E6
            DF8C732A3A97E6281803E34C55E2FF00F3841A2EB1E5CFF9C57FCA0D03CC3A55
            DE87AE691A75E5B6A9A3DFC2F6F736F347A8DD068E58A4019483E23157B47903
            F2ABC81F95A7CD29E42F2E41E5983CE5AC49AF6B96568CE2DDAFA68D2391E284
            B148558203C230AB52683157CBFF00967A56A6BFF39CFF00F3911E64FA94ADE5
            FD6FC93E588B47D710092D2E24B41E8DC4692A12BCE3914AB292187853157DCD
            8ABB1548B5EF2DF977CD560749F34683A779934A67595B4DD52D61BCB72E95E2
            C629D5D6A2BB1A62AF8D3F2B7C91A8F963FE736FF3F75087CA92E83E4ED5FC8B
            E568FCAB790DA7D5F4D9C5AA88A78ED99144558DC10CA371E1438ABDC7F397F2
            A752F38FE86F3CFE5FEAB1794FF39BC86B2BF923CCD2A96B5BA865A35C68FAAC
            69BCD6377C4061F6A37E32C7465A32A987E5D79B2D7F3B7F2EF508BCEBE41BBF
            2E5E3CD77E5BFCC0F206BF6FCE38EF20012EE14775F4EEADDC3831CC9557523A
            354055977913C8DE51FCA8F25E93E49F28590D0BCA1E578665D32CE59E4956DE
            17964B892B34EEEE406763566D87B62AF967FE708F42D6B41D2FFE720E2D6B4E
            9F4F7D43F393CC97FA7BCA3F77736B72B6D24371048A4A491C88C0AB2920E2AF
            B7F15762AC0FCC3F96BE44F367997CA3E71F317962CB52F34F90EE5EEBCA3AFB
            AB2DD59492A346E12442A4A32B1AA3556BBD2A01C55F397FCE7E957FF9C46FCE
            3B5F5A28E7BCB0B34B48A596388CAF1EA16D33247EA32866F4E3660A37201A03
            8ABE96FCBC9639BC81E479A191658A5F2FE98F1CA8432B2B5AC641046C411DF1
            5782F9D3FE7157F23A1B2F3E79CFCB3F941A1B7E615F687ABFE89BA86DF995BD
            B9B59555AD6D9D8DBC523BB7DA8D14F235AD7155FF00F384DA3EB1E5FF00F9C5
            9FC9DD0FCC1A5DE689ADE95A55C5B6ABA4DFC2F6F736F3477D72AF1CB148032B
            03D4118ABD33CDBF90BF931E7BF34E9FE76F39FE597977CCDE6AD2CC66D35CBF
            B18A69FF00754F4C4848A4A12838890353B62AF03FF9CB8F2C79935CF39FFCE2
            4EABA1E837DABE9BE56FCDFD1EF3CC9796703CD1D85B48444B3DC7007847CD82
            963B024548C55F4DFE64FE59791FF377CA5A9F91BF30B4083CC7E5AD4F8B4D67
            316478E58CD639A09632B245221FB2E8C08DC74241552CFCD5B28E1FC9EFCC0D
            12C4223DC794F54D2B46B579554C934B632C16D02BCAC2ACEC55454EE7157987
            FCE1769BA8E8FF00F38B7F92BA5EAD6171A5EA561E5E482FB4FBA8DA29A19126
            94323A3004107157D438ABE25FF9CD571E69D1FF0026FF00246D5D9B52FCE5FC
            C6D1AD2E6DD472A68FA34CBA9EA73301BF18D614AFFAD8ABEDAA0F0C55FFD1FA
            3FFF003939A56BBF95DE75F247FCE5979374D9F55FF957D6B2F97FF39BCBF660
            99B51F275E482492744520BC9A74DFBF51BED5ECA7157D7BE59F32E81E72D034
            7F34F95F55B7D73CBBAF5AC77DA3EAD68FCE19E094725753FAC1DC1D880462AC
            8315518A28A08D21863586188058E24015540E8001B018AAB62AEC55D8ABB157
            62AEC55F1F6ABFF387FE4BD13CD3E60FCD2FC96D5B52FCA6FCD7D5AF26D51753
            B3BA9E6D12EEEA66E72DBEA3A43BFA32DB4ED52EA81194B168D9580C55EE7F96
            3E7BD4FCE7A5DFDB799BCB93F943CF1E57B81A779C7CBB27292DE3BAE01D67B1
            BA2AAB736B3A1124522EF43C5C2BAB2855E9D8ABB15762AEC55D8AA5FA969B61
            AC69B7FA46AB6915FE99AA5B4B67A8D8CEA1E29A09D0C72C6EA762ACAC411E18
            ABE3FD0BFE71761FF9C7E0FE67FF009C64BAD46C2EE021FCC1F951ACEAB3DCE8
            5E62B55356811AE5A4FA85E2A93F57B84F8437C132B46CC5557D4FE4FF003558
            F9D3CB9A679934EB4BFD3A0D455C4BA5EAB6CF677D6971048D0DC5B5CC120AA4
            90CA8C8D42549155665218AACA715762AFCF6FF9CB4D0ED2D7F377F28BF323F3
            33F2DF5EFCD9FC8CF27E8DACC3A8F96344D3CEB2B65E61B9787EA77B79A60204
            B1B441A357350AD4AD2BBAA8BFCACBFF0034791BC95FF2B6BF2F3F28FCD1E47F
            CB0BABDBA93CD7FF0038EBAB00FA85A69E8E0AEBBE5CB7E44C0CC87D496C3659
            072F482C807AAABEE8D1359D37CC5A3E93E60D1AE4DE691AE59C1A869777C1E3
            F56DEE6359627E122ABAF246068C011DC038AA6D8ABB15762AEC5580FE657E5B
            7937F36FC9BAC7903CFDA326B9E58D79116F2D0BB46EAF1B89229629632AF1C9
            1BA865653507DAB8ABE74D33F2DB59FF009C558E2D53F2C2E35DF37FE49C756F
            397E585EDC4DAA6A1A2C7FB5AA681249CA6748C6F3D992DC96AF0FEF070755F5
            936B9A4C7A29F31CFA8436BA12591D465D52E1BD1863B411FAC6691A4E3C1427
            C44B5283AE2AF8A7F21FEB7FF3905F9D1E62FF009CA6D46CE6B6FCBDF2F58CFE
            4DFF009C78B5B94646B9B2321FD2BAF053C4817722FA51123FBB041E83157DDB
            8ABFFFD2FBEB2C515C4524334693413218E68640195D58519594EC411B107157
            C333FE49FE70FF00CE3CEB9A9F98BFE716E4D3FCD1F975AE5E3DFF00987FE71D
            3CC373F53B6B7B894F2967F2F6A2DC85A190924C320F4EBF40555388BFE7312F
            B4D8D6DFCEBFF38C3F9D1E5CD65769ECAC7CBABAC5B5475315E5ACE1245AF420
            0C555BFE875BCBBFF9607F3CFF00F0899FFEABE2AEFF00A1D6F2EFFE581FCF3F
            FC2267FF00AAF8ABBFE875BCBBFF009607F3CFFF000899FF00EABE2AEFFA1D6F
            2EFF00E581FCF3FF00C2267FFAAF8ABBFE875BCBBFF9607F3CFF00F0899FFEAB
            E2AEFF00A1D6F2EFFE581FCF3FFC2267FF00AAF8ABBFE875BCBBFF009607F3CF
            FF000899FF00EABE2AEFFA1D6F2EFF00E581FCF3FF00C2267FFAAF8ABBFE875B
            CBBFF9607F3CFF00F0899FFEABE2AEFF00A1D6F2EFFE581FCF3FFC2267FF00AA
            F8ABBFE875BCBBFF009607F3CFFF000899FF00EABE2AEFFA1D6F2EFF00E581FC
            F3FF00C2267FFAAF8ABBFE875BCBBFF9607F3CFF00F0899FFEABE2AEFF00A1D6
            F2EFFE581FCF3FFC2267FF00AAF8ABBFE875BCBBFF009607F3CFFF000899FF00
            EABE2AEFFA1D6F2EFF00E581FCF3FF00C2267FFAAF8ABBFE875BCBBFF9607F3C
            FF00F0899FFEABE2AEFF00A1D6F2EFFE581FCF3FFC2267FF00AAF8ABBFE875BC
            BBFF009607F3CFFF000899FF00EABE2AEFFA1D6F2EFF00E581FCF3FF00C2267F
            FAAF8ABBFE875BCBBFF9607F3CFF00F0899FFEABE2AEFF00A1D6F2EFFE581FCF
            3FFC2267FF00AAF8ABBFE875BCBBFF009607F3CFFF000899FF00EABE2AEFFA1D
            6F2EFF00E581FCF3FF00C2267FFAAF8ABBFE875BCBBFF9607F3CFF00F0899FFE
            ABE2AEFF00A1D6F2EFFE581FCF3FFC2267FF00AAF8ABBFE875BCBBFF009607F3
            CFFF000899FF00EABE2AB24FF9CC917B1BC3E58FF9C69FCEED775661FE8F6137
            954D844C7B7A97371701231EE71563B71F95BF9EFF00F393B7B6CDFF00390315
            BFE51FE49C52A5C37E466857FF005BD575D11B09224D7F53878A2C35A72821EB
            4A371346C55F7269DA75868FA7D9695A55943A6E9BA65BC76BA769F6C8B14304
            10A848E28D1405554500000500C5530C55FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 132.283550000000000000
        Top = 453.543600000000000000
        Width = 718.110700000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 18.897650000000000000
          Width = 684.094930000000000000
          Height = 60.472480000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              'N.B.- THIS CARD MUST BE PRESENTED ON ABOVE DATE AND TIME. PLEASE' +
              ' RETAIN THE ADMIT CARD  FOR ADMISSION PURPOSE.')
          ParentFont = False
        end
      end
    end
    object Page3: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        DataSetName = 'frxttbTrnsDet1'
        KeepChild = True
        RowCount = 0
        object frxttbTrnsDet1Descr: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Descr'
          DataSetName = 'frxttbTrnsDet1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxttbTrnsDet1."Descr"]')
        end
        object frxttbTrnsDet1Amount: TfrxMemoView
          AllowVectorExport = True
          Left = 120.944960000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'Amount'
          DataSetName = 'frxttbTrnsDet1'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxttbTrnsDet1."Amount"]')
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object MasterData3: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        DataSetName = 'frxttbTrnsDet2'
        RowCount = 0
        object frxttbTrnsDet2Descr: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'Descr'
          DataSetName = 'frxttbTrnsDet2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxttbTrnsDet2."Descr"]')
        end
        object frxttbTrnsDet2Amount: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'Amount'
          DataSetName = 'frxttbTrnsDet2'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxttbTrnsDet2."Amount"]')
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 60.472480000000000000
        Width = 740.409927000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 11.338590000000000000
          Width = 389.291590000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total deductions : [SUM(<frxttbTrnsDet2."Amount">,MasterData3)]')
          ParentFont = False
        end
      end
    end
  end
  object MyConnectDialog1: TMyConnectDialog
    Caption = 'Connect'
    ConnectButton = 'Connect'
    CancelButton = 'Cancel'
    Server.Caption = 'Server'
    Server.Visible = True
    Server.Order = 0
    UserName.Caption = 'User Name'
    UserName.Visible = True
    UserName.Order = 2
    Password.Caption = 'Password'
    Password.Visible = True
    Password.Order = 3
    Database.Caption = 'Database'
    Database.Visible = True
    Database.Order = 4
    Port.Caption = 'Port'
    Port.Visible = True
    Port.Order = 1
    Direct.Caption = 'Mode'
    Direct.Visible = False
    Direct.Order = 5
    Left = 944
    Top = 680
  end
  object dsFeeProf: TMyDataSource
    DataSet = tbFeeProf
    Left = 376
    Top = 448
  end
  object tbFeeProf: TMyTable
    TableName = 'fee_prof'
    Connection = myconn
    Left = 440
    Top = 448
    object tbFeeProfcode: TSmallintField
      FieldName = 'code'
      Origin = 'fee_prof.code'
    end
    object tbFeeProfdescr: TStringField
      FieldName = 'descr'
      Origin = 'fee_prof.descr'
      Size = 30
    end
  end
  object dsFeeProfDet: TMyDataSource
    DataSet = fee_prof_det
    Left = 40
    Top = 800
  end
  object fee_prof_det: TMyTable
    TableName = 'fee_prof_det'
    MasterFields = 'code'
    DetailFields = 'fee_prof_code'
    MasterSource = dsFeeProf
    Connection = myconn
    Left = 136
    Top = 800
    object fee_prof_detfee_prof_code: TSmallintField
      FieldName = 'fee_prof_code'
    end
    object fee_prof_detclcode: TSmallintField
      FieldName = 'clcode'
    end
    object fee_prof_detclCaption: TStringField
      FieldKind = fkLookup
      FieldName = 'clCaption'
      LookupDataSet = ClMast
      LookupKeyFields = 'CLCODE'
      LookupResultField = 'CLCAPTION'
      KeyFields = 'clcode'
      Lookup = True
    end
  end
  object qryfeeheadsall: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'select sm_fee.mr_no,mr_date,ac_name,ac_amtpaid ac_amt '
      'from fee_detail sm_fee_detail '
      
        'inner join fee sm_fee on sm_fee.mr_no =sm_fee_detail.mr_no and s' +
        'tudid is not null '
      
        'inner join ac_master sm_ac_master on sm_ac_master.ac_no=sm_fee_d' +
        'etail.ac_no'
      'where mr_date between :sdt and :edt and AC_AMTPAID is not null'
      '--'
      '--'
      '--')
    Left = 841
    Top = 16
    ParamData = <
      item
        DataType = ftDate
        Name = 'sdt'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'edt'
        Value = nil
      end>
    object qryfeeheadsallpaiddate: TDateField
      FieldName = 'mr_date'
    end
    object qryfeeheadsallac_name: TStringField
      FieldName = 'ac_name'
    end
    object qryfeeheadsallac_amt: TCurrencyField
      FieldName = 'ac_amt'
    end
    object qryfeeheadsallmr_no: TStringField
      FieldName = 'mr_no'
      Size = 12
    end
  end
  object qryfeeheadspl: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'select sm_fee.mr_no,mr_date,ac_name,ac_amtpaid ac_amt '
      'from fee_detail sm_fee_detail '
      
        'inner join fee sm_fee on sm_fee.mr_no =sm_fee_detail.mr_no and s' +
        'tudid is not null '
      
        'inner join ac_master sm_ac_master on sm_ac_master.ac_no=sm_fee_d' +
        'etail.ac_no'
      'where mr_date between :sdt and :edt and AC_AMTPAID is not null'
      '--'
      '--'
      '--')
    Left = 841
    Top = 64
    ParamData = <
      item
        DataType = ftDate
        Name = 'sdt'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'edt'
        Value = nil
      end>
    object DateField1: TDateField
      FieldName = 'mr_date'
    end
    object StringField4: TStringField
      FieldName = 'ac_name'
    end
    object CurrencyField2: TCurrencyField
      FieldName = 'ac_amt'
    end
    object qryfeeheadsplmr_no: TStringField
      FieldName = 'mr_no'
      Size = 12
    end
  end
  object qryfeeheadgnrl: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'select sm_fee.mr_no,mr_date,ac_name,ac_amtpaid ac_amt from ac_ma' +
        'ster sm_ac_master,fee sm_fee,'
      ' fee_detail sm_fee_detail'
      ' where sm_fee.mr_no=sm_fee_detail.mr_no '
      
        'and sm_ac_master.ac_no=sm_fee_detail.ac_no and studid is not nul' +
        'l'
      'and mr_date between :sdt and :edt and AC_AMTPAID is not null'
      '--'
      '--'
      '--')
    Left = 841
    Top = 112
    ParamData = <
      item
        DataType = ftDate
        Name = 'sdt'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'edt'
        Value = nil
      end>
    object DateField2: TDateField
      FieldName = 'mr_date'
    end
    object StringField5: TStringField
      FieldName = 'ac_name'
    end
    object CurrencyField3: TCurrencyField
      FieldName = 'ac_amt'
    end
    object qryfeeheadgnrlmr_no: TStringField
      FieldName = 'mr_no'
      Size = 12
    end
  end
  object qryFeeFulldtl: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'select sm_fee.mr_no,sm_fee.StudId,Name,sm_studmast.clcode,clcapt' +
        'ion,'
      
        'sm_studmast.section,sm_fee.mr_date,ac_name,ac_amtpaid ac_amt fro' +
        'm studmast sm_studmast,'
      
        'ac_master sm_ac_master,fee sm_fee,fee_detail sm_fee_detail ,clma' +
        'st sm_clmast'
      'where sm_fee.mr_no =sm_fee_detail.mr_no '
      'and sm_studmast.clcode=sm_clmast.clcode'
      'and sm_ac_master.ac_no=sm_fee_detail.ac_no  '
      
        'and sm_fee.StudId = sm_studmast.StudId and sm_fee.studid is not ' +
        'null'
      'and mr_date between :sdt and :edt and AC_AMTPAID is not null'
      '--'
      '--'
      '--')
    Left = 849
    Top = 160
    ParamData = <
      item
        DataType = ftDate
        Name = 'sdt'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'edt'
        Value = nil
      end>
    object qryFeeFulldtlStudId: TFloatField
      FieldName = 'StudId'
    end
    object qryFeeFulldtlName: TStringField
      FieldName = 'Name'
      Size = 40
    end
    object qryFeeFulldtlclcode: TSmallintField
      FieldName = 'clcode'
    end
    object qryFeeFulldtlsection: TStringField
      FieldName = 'section'
      Size = 2
    end
    object qryFeeFulldtlpaiddate: TDateField
      FieldName = 'mr_date'
    end
    object qryFeeFulldtlac_name: TStringField
      FieldName = 'ac_name'
    end
    object qryFeeFulldtlac_amt: TCurrencyField
      FieldName = 'ac_amt'
    end
    object qryFeeFulldtlStudent_Detail: TStringField
      FieldKind = fkCalculated
      FieldName = 'Student_Detail'
      Calculated = True
    end
    object qryFeeFulldtlclcaption: TStringField
      FieldName = 'clcaption'
      Size = 10
    end
    object qryFeeFulldtlmr_no: TStringField
      FieldName = 'mr_no'
      Size = 12
    end
  end
  object frxReport1: TfrxReport
    Version = '6.3.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39356.522790428200000000
    ReportOptions.LastChange = 43484.789752581020000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 608
    Top = 672
  end
  object frxDBqrycllist: TfrxDBDataset
    UserName = 'frxDBqrycllist'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ClCode=ClCode'
      'Section=Section'
      'AdmNo=AdmNo'
      'Name=Name'
      'RollNo=RollNo'
      'Fname=Fname'
      'DOB=DOB'
      'Phone=Phone'
      'SEX=SEX'
      'MNAME=MNAME'
      'CASTE=CASTE'
      'fee_type=fee_type')
    OpenDataSource = False
    DataSet = qryCllist
    BCDToCurrency = False
    Left = 808
    Top = 368
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'sheetslno=sheetslno'
      'studid=studid'
      'name=name'
      'class=class'
      'sec=sec'
      'M_phone=M_phone'
      'sh_date=sh_date')
    DataSet = qryabsentee
    BCDToCurrency = False
    Left = 824
    Top = 432
  end
  object frxDBcastrepo: TfrxDBDataset
    UserName = 'frxDBcastrepo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'StudID=StudID'
      'Name=Name'
      'clcode=clcode'
      'Cl_code=Cl_code'
      'RollNo=RollNo'
      'Section=Section'
      'DOB=DOB'
      'Sex=Sex'
      'GName=GName'
      'Fname=Fname'
      'Mname=Mname'
      'LAddr=LAddr'
      'PAddr=PAddr'
      'CatCode=CatCode'
      'DOA=DOA'
      'Age=Age'
      'Photo=Photo'
      'NOTERMS=NOTERMS'
      'Phone=Phone'
      'Eml=Eml'
      'M_Phone=M_Phone'
      'Religion=Religion'
      'Cast=Cast'
      'NofSB=NofSB'
      'F_occp=F_occp'
      'F_qual=F_qual'
      'M_qual=M_qual'
      'M_occp=M_occp'
      'SchLast=SchLast'
      'BloodGroup=BloodGroup'
      'House=House'
      'Mtounge=Mtounge'
      'Remark=Remark'
      'ByBus=ByBus'
      'UpGrdYr=UpGrdYr'
      'Stud_status=Stud_status'
      'clcode_1=clcode_1'
      'Clcaption=Clcaption'
      'Desc=Desc'
      'Mfee=Mfee'
      'UPClass=UPClass'
      'Adfee=Adfee')
    DataSet = qrycastrepo
    BCDToCurrency = False
    Left = 720
    Top = 541
  end
  object qryabsentee: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'select absentees.sheetslno, studmast.studid, studmast.name, abse' +
        'ntees.class, absentees.sec, absenteesmast.sh_date, studmast.M_ph' +
        'one from sm_absentees absentees '
      
        'inner join sm_absenteesmast absenteesmast on (absentees.sheetsln' +
        'o=absenteesmast.sheetslno)'
      
        'inner join sm_studmast studmast on (absentees.studid=studmast.st' +
        'udid) where absenteesmast.sh_date=:dt order by absentees.class, ' +
        'sec'
      'and (studmast.ClCode>0) and (studmast.CatCode<>0)')
    Left = 917
    Top = 21
    ParamData = <
      item
        DataType = ftDate
        Name = 'dt'
        ParamType = ptInput
        Value = nil
      end>
    object qryabsenteesheetslno: TFloatField
      FieldName = 'sheetslno'
      Origin = 'MYDB."absentees".Sheetslno'
    end
    object qryabsenteestudid: TFloatField
      FieldName = 'studid'
      Origin = 'MYDB."absentees".StudId'
    end
    object qryabsenteename: TStringField
      FieldName = 'name'
      Origin = 'MYDB."absentees".Name'
      Size = 40
    end
    object qryabsenteeclass: TFloatField
      FieldName = 'class'
      Origin = 'MYDB."absentees".Class'
    end
    object qryabsenteesec: TStringField
      FieldName = 'sec'
      Origin = 'MYDB."absentees".Sec'
      Size = 10
    end
    object qryabsenteeM_phone: TStringField
      FieldName = 'M_phone'
    end
    object qryabsenteesh_date: TDateField
      FieldName = 'sh_date'
      Origin = 'MYDB."absenteesmast".Sh_Date'
    end
  end
  object qrycastrepo: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'select * from sm_studmast '
      
        'inner join sm_clmast on (sm_studmast.clcode=sm_clmast.clcode) wh' +
        'ere doa between :sdt and :edt'
      'and (sm_studmast.clcode>0)')
    Left = 917
    Top = 68
    ParamData = <
      item
        DataType = ftDate
        Name = 'sdt'
        ParamType = ptInput
        Value = '01/01/2008'
      end
      item
        DataType = ftDate
        Name = 'edt'
        ParamType = ptInput
        Value = '31/12/2010'
      end>
    object qrycastrepoStudID: TFloatField
      FieldName = 'StudID'
      Origin = 'MYDB."studmast".StudID'
    end
    object qrycastrepoName: TStringField
      FieldName = 'Name'
      Origin = 'MYDB."studmast".Name'
      Size = 40
    end
    object qrycastrepoclcode: TSmallintField
      FieldName = 'clcode'
      Origin = 'MYDB."studmast".ClCode'
    end
    object qrycastrepoCl_code: TSmallintField
      FieldName = 'Cl_code'
      Origin = 'MYDB."studmast".Cl_code'
    end
    object qrycastrepoRollNo: TFloatField
      FieldName = 'RollNo'
      Origin = 'MYDB."studmast".RollNo'
    end
    object qrycastrepoSection: TStringField
      FieldName = 'Section'
      Origin = 'MYDB."studmast".Section'
      Size = 1
    end
    object qrycastrepoDOB: TDateField
      FieldName = 'DOB'
      Origin = 'MYDB."studmast".DOB'
    end
    object qrycastrepoSex: TStringField
      FieldName = 'Sex'
      Origin = 'MYDB."studmast".Sex'
      Size = 1
    end
    object qrycastrepoGName: TStringField
      FieldName = 'GName'
      Origin = 'MYDB."studmast".GName'
      Size = 40
    end
    object qrycastrepoFname: TStringField
      FieldName = 'Fname'
      Origin = 'MYDB."studmast".Fname'
      Size = 40
    end
    object qrycastrepoMname: TStringField
      FieldName = 'Mname'
      Origin = 'MYDB."studmast".Mname'
      Size = 40
    end
    object qrycastrepoLAddr: TMemoField
      FieldName = 'LAddr'
      Origin = 'MYDB."studmast".LAddr'
      BlobType = ftMemo
      Size = 20
    end
    object qrycastrepoPAddr: TMemoField
      FieldName = 'PAddr'
      Origin = 'MYDB."studmast".PAddr'
      BlobType = ftMemo
      Size = 20
    end
    object qrycastrepoCatCode: TFloatField
      FieldName = 'CatCode'
      Origin = 'MYDB."studmast".CatCode'
    end
    object qrycastrepoDOA: TDateField
      FieldName = 'DOA'
      Origin = 'MYDB."studmast".DOA'
    end
    object qrycastrepoAge: TStringField
      FieldName = 'Age'
      Origin = 'MYDB."studmast".Age'
    end
    object qrycastrepoPhoto: TGraphicField
      FieldName = 'Photo'
      Origin = 'MYDB."studmast".Photo'
      BlobType = ftGraphic
    end
    object qrycastrepoNOTERMS: TFloatField
      FieldName = 'NOTERMS'
      Origin = 'MYDB."studmast".NOTERMS'
    end
    object qrycastrepoPhone: TStringField
      FieldName = 'Phone'
      Origin = 'MYDB."studmast".Phone'
    end
    object qrycastrepoEml: TStringField
      FieldName = 'Eml'
      Origin = 'MYDB."studmast".Eml'
      Size = 35
    end
    object qrycastrepoM_Phone: TStringField
      FieldName = 'M_Phone'
      Origin = 'MYDB."studmast".M_Phone'
    end
    object qrycastrepoReligion: TStringField
      FieldName = 'Religion'
      Origin = 'MYDB."studmast".Religion'
      Size = 15
    end
    object qrycastrepoCast: TStringField
      FieldName = 'Cast'
      Origin = 'MYDB."studmast".Cast'
      Size = 15
    end
    object qrycastrepoNofSB: TStringField
      FieldName = 'NofSB'
      Origin = 'MYDB."studmast".NofSB'
      Size = 30
    end
    object qrycastrepoF_occp: TStringField
      FieldName = 'F_occp'
      Origin = 'MYDB."studmast".F_occp'
    end
    object qrycastrepoF_qual: TStringField
      FieldName = 'F_qual'
      Origin = 'MYDB."studmast".F_qual'
    end
    object qrycastrepoM_qual: TStringField
      FieldName = 'M_qual'
      Origin = 'MYDB."studmast".M_qual'
    end
    object qrycastrepoM_occp: TStringField
      FieldName = 'M_occp'
      Origin = 'MYDB."studmast".M_occp'
    end
    object qrycastrepoSchLast: TStringField
      FieldName = 'SchLast'
      Origin = 'MYDB."studmast".SchLast'
      Size = 30
    end
    object qrycastrepoBloodGroup: TStringField
      FieldName = 'BloodGroup'
      Origin = 'MYDB."studmast".BloodGroup'
      Size = 15
    end
    object qrycastrepoHouse: TStringField
      FieldName = 'House'
      Origin = 'MYDB."studmast".House'
      Size = 25
    end
    object qrycastrepoMtounge: TStringField
      FieldName = 'Mtounge'
      Origin = 'MYDB."studmast".Mtounge'
      Size = 15
    end
    object qrycastrepoRemark: TMemoField
      FieldName = 'Remark'
      Origin = 'MYDB."studmast".Remark'
      BlobType = ftMemo
      Size = 20
    end
    object qrycastrepoByBus: TBooleanField
      FieldName = 'ByBus'
      Origin = 'MYDB."studmast".ByBus'
    end
    object qrycastrepoUpGrdYr: TStringField
      FieldName = 'UpGrdYr'
      Origin = 'MYDB."studmast".UpGrdYr'
      Size = 2
    end
    object qrycastrepoStud_status: TStringField
      FieldName = 'Stud_status'
      Origin = 'MYDB."studmast".Stud_status'
    end
    object qrycastrepoclcode_1: TSmallintField
      FieldName = 'clcode_1'
      Origin = 'MYDB."studmast".Stud_status'
    end
    object qrycastrepoClcaption: TStringField
      FieldName = 'Clcaption'
      Origin = 'MYDB."studmast".Stud_status'
      Size = 10
    end
    object qrycastrepoDesc: TStringField
      FieldName = 'Desc'
      Origin = 'MYDB."studmast".Stud_status'
      Size = 15
    end
    object qrycastrepoMfee: TCurrencyField
      FieldName = 'Mfee'
      Origin = 'MYDB."studmast".Stud_status'
    end
    object qrycastrepoUPClass: TSmallintField
      FieldName = 'UPClass'
      Origin = 'MYDB."studmast".Stud_status'
    end
    object qrycastrepoAdfee: TCurrencyField
      FieldName = 'Adfee'
      Origin = 'MYDB."studmast".Stud_status'
    end
  end
  object qryCurrentStud: TMyQuery
    Connection = myconn
    SQL.Strings = (
      'select studmast.*,catgrmast.descr catdesc from studmast'
      'inner join catgrmast on studmast.catcode=catgrmast.catcode '
      
        'where studmast.catcode<>0 and nso=0 and tc_status=0 and clcode<9' +
        '0')
    OnCalcFields = qryCurrentStudCalcFields
    Left = 920
    Top = 116
    object qryCurrentStudStudID: TFloatField
      FieldName = 'StudID'
    end
    object qryCurrentStudName: TStringField
      FieldName = 'Name'
      Size = 40
    end
    object qryCurrentStudClCode: TSmallintField
      FieldName = 'ClCode'
    end
    object qryCurrentStudCl_code: TSmallintField
      FieldName = 'ADM_CL'
    end
    object qryCurrentStudRollNo: TFloatField
      FieldName = 'RollNo'
    end
    object qryCurrentStudSection: TStringField
      FieldName = 'Section'
      Size = 2
    end
    object qryCurrentStudDOB: TDateField
      FieldName = 'DOB'
    end
    object qryCurrentStudSex: TStringField
      FieldName = 'Sex'
      Size = 1
    end
    object qryCurrentStudGName: TStringField
      FieldName = 'GName'
      Size = 40
    end
    object qryCurrentStudFname: TStringField
      FieldName = 'Fname'
      Size = 40
    end
    object qryCurrentStudMname: TStringField
      FieldName = 'Mname'
      Size = 40
    end
    object qryCurrentStudLAddr: TMemoField
      FieldName = 'LAddr'
      BlobType = ftMemo
      Size = 20
    end
    object qryCurrentStudPAddr: TMemoField
      FieldName = 'PAddr'
      BlobType = ftMemo
      Size = 20
    end
    object qryCurrentStudCatCode: TFloatField
      FieldName = 'CatCode'
    end
    object qryCurrentStudDOA: TDateField
      FieldName = 'DOA'
    end
    object qryCurrentStudAge: TStringField
      FieldName = 'Age'
    end
    object qryCurrentStudPhoto: TGraphicField
      FieldName = 'Photo'
      BlobType = ftGraphic
    end
    object qryCurrentStudNOTERMS: TFloatField
      FieldName = 'NOTERMS'
    end
    object qryCurrentStudPhone: TStringField
      FieldName = 'Phone'
    end
    object qryCurrentStudEml: TStringField
      FieldName = 'Eml'
      Size = 35
    end
    object qryCurrentStudM_Phone: TStringField
      FieldName = 'M_Phone'
    end
    object qryCurrentStudReligion: TStringField
      FieldName = 'Religion'
      Size = 15
    end
    object qryCurrentStudCast: TStringField
      FieldName = 'Caste'
      Size = 15
    end
    object qryCurrentStudNofSB: TStringField
      FieldName = 'NOFSB'
      Size = 30
    end
    object qryCurrentStudF_occp: TStringField
      FieldName = 'F_occp'
    end
    object qryCurrentStudF_qual: TStringField
      FieldName = 'F_qual'
    end
    object qryCurrentStudM_qual: TStringField
      FieldName = 'M_qual'
    end
    object qryCurrentStudM_occp: TStringField
      FieldName = 'M_occp'
    end
    object qryCurrentStudSchLast: TStringField
      FieldName = 'SchLast'
      Size = 30
    end
    object qryCurrentStudBloodGroup: TStringField
      FieldName = 'BloodGroup'
      Size = 15
    end
    object qryCurrentStudHouse: TStringField
      FieldName = 'House'
      Size = 25
    end
    object qryCurrentStudMtounge: TStringField
      FieldName = 'Mtounge'
      Size = 15
    end
    object qryCurrentStudRemark: TMemoField
      FieldName = 'Remark'
      BlobType = ftMemo
      Size = 20
    end
    object qryCurrentStudByBus: TBooleanField
      FieldName = 'ByBus'
    end
    object qryCurrentStudUpGrdYr: TStringField
      FieldName = 'UpGrdYr'
      Size = 2
    end
    object qryCurrentStudrage: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'rage'
      Calculated = True
    end
    object qryCurrentStudcage: TStringField
      FieldKind = fkCalculated
      FieldName = 'cage'
      Calculated = True
    end
    object qryCurrentStudstClDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'stClDesc'
      LookupDataSet = ClMast
      LookupKeyFields = 'ClCode'
      LookupResultField = 'DESCR'
      KeyFields = 'ClCode'
      Lookup = True
    end
    object qryCurrentStudcatdesc: TStringField
      FieldName = 'catdesc'
    end
  end
  object tbStud_docs: TMyTable
    TableName = 'stud_docs'
    MasterFields = 'STUDID'
    DetailFields = 'studid'
    MasterSource = studmastS
    Connection = myconn
    Left = 296
    Top = 808
    object tbStud_docsstudid: TFloatField
      FieldName = 'studid'
    end
    object tbStud_docsdoc_code: TLargeintField
      FieldName = 'doc_code'
    end
    object tbStud_docsscan_copy: TBlobField
      FieldName = 'scan_copy'
    end
    object tbStud_docsdoc_descr: TStringField
      FieldKind = fkLookup
      FieldName = 'doc_descr'
      LookupDataSet = tbDoc_type
      LookupKeyFields = 'doc_code'
      LookupResultField = 'doc_descr'
      KeyFields = 'doc_code'
      Lookup = True
    end
  end
  object dsStud_docs: TMyDataSource
    DataSet = tbStud_docs
    Left = 232
    Top = 808
  end
  object tbDoc_type: TMyTable
    TableName = 'doc_type'
    Connection = myconn
    Left = 440
    Top = 760
    object tbDoc_typedoc_code: TLargeintField
      FieldName = 'doc_code'
    end
    object tbDoc_typedoc_descr: TStringField
      FieldName = 'doc_descr'
      Size = 25
    end
  end
  object dsDoc_type: TMyDataSource
    DataSet = tbDoc_type
    Left = 368
    Top = 760
  end
  object dsRelmast: TMyDataSource
    DataSet = tbRelmast
    Left = 224
    Top = 696
  end
  object tbRelmast: TMyTable
    TableName = 'relmast'
    Connection = myconn
    Left = 296
    Top = 696
    object tbRelmastrelcode: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'relcode'
      Origin = 'relmast.relcode'
    end
    object tbRelmastrelinfo: TStringField
      FieldName = 'relinfo'
      Origin = 'relmast.relinfo'
      Size = 30
    end
  end
  object dsComp: TMyDataSource
    DataSet = tbComp
    Left = 368
    Top = 544
  end
  object tbComp: TMyTable
    TableName = 'compmast'
    Connection = myconn
    Left = 440
    Top = 544
    object tbCompcmp_id: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'code'
      FieldName = 'cmp_id'
      Origin = 'compmast.cmp_id'
    end
    object tbCompcmpname: TStringField
      DisplayLabel = 'Company'
      FieldName = 'cmpname'
      Origin = 'compmast.cmpname'
      Size = 25
    end
    object tbCompcmp_group: TStringField
      DisplayLabel = 'Company group'
      FieldName = 'cmp_group'
      Origin = 'compmast.cmp_group'
      Size = 25
    end
  end
  object sp_cllist: TMyStoredProc
    StoredProcName = 'sp_cllist'
    Connection = myconn
    SQL.Strings = (
      'CALL sp_cllist(:p_clcode, :p_section)')
    Left = 520
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_clcode'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'p_section'
        ParamType = ptInput
        Size = 1
        Value = nil
      end>
    CommandStoredProcName = 'sp_cllist'
  end
  object ds_spcllist: TMyDataSource
    DataSet = sp_cllist
    Left = 520
    Top = 72
  end
  object adm_studmastS: TMyDataSource
    DataSet = adm_studmast
    Left = 40
    Top = 544
  end
  object adm_studmast: TMyTable
    TableName = 'adm_studmast'
    Connection = myconn
    AfterOpen = adm_studmastAfterEdit
    AfterInsert = adm_studmastAfterInsert
    AfterEdit = adm_studmastAfterEdit
    BeforePost = adm_studmastBeforePost
    AfterPost = adm_studmastAfterEdit
    AfterCancel = adm_studmastAfterEdit
    AfterDelete = adm_studmastAfterEdit
    OnCalcFields = adm_studmastCalcFields
    Left = 136
    Top = 544
    object adm_studmastSTUDID: TFloatField
      FieldName = 'STUDID'
      Origin = 'adm_studmast.STUDID'
      EditFormat = '####/##'
    end
    object adm_studmastADMNO: TStringField
      FieldName = 'ADMNO'
      Origin = 'adm_studmast.ADMNO'
      Size = 10
    end
    object adm_studmastNAME: TStringField
      FieldName = 'NAME'
      Origin = 'adm_studmast.NAME'
      Size = 40
    end
    object adm_studmastCLCODE: TSmallintField
      FieldName = 'CLCODE'
      Origin = 'adm_studmast.CLCODE'
    end
    object adm_studmastROLLNO: TFloatField
      FieldName = 'ROLLNO'
      Origin = 'adm_studmast.ROLLNO'
    end
    object adm_studmastSECTION: TStringField
      FieldName = 'SECTION'
      Origin = 'adm_studmast.SECTION'
      Size = 2
    end
    object adm_studmastDOB: TDateField
      FieldName = 'DOB'
      Origin = 'adm_studmast.DOB'
      OnValidate = studmastDOBValidate
    end
    object adm_studmastSEX: TStringField
      FieldName = 'SEX'
      Origin = 'adm_studmast.SEX'
      Size = 1
    end
    object adm_studmastGNAME: TStringField
      FieldName = 'GNAME'
      Origin = 'adm_studmast.GNAME'
      Size = 40
    end
    object adm_studmastFNAME: TStringField
      FieldName = 'FNAME'
      Origin = 'adm_studmast.FNAME'
      Size = 40
    end
    object adm_studmastMNAME: TStringField
      FieldName = 'MNAME'
      Origin = 'adm_studmast.MNAME'
      Size = 40
    end
    object adm_studmastLADDR: TMemoField
      FieldName = 'LADDR'
      Origin = 'adm_studmast.LADDR'
      BlobType = ftMemo
    end
    object adm_studmastPADDR: TMemoField
      FieldName = 'PADDR'
      Origin = 'adm_studmast.PADDR'
      BlobType = ftMemo
    end
    object adm_studmastCATCODE: TFloatField
      FieldName = 'CATCODE'
      Origin = 'adm_studmast.CATCODE'
    end
    object adm_studmastDOA: TDateField
      FieldName = 'DOA'
      Origin = 'adm_studmast.DOA'
    end
    object adm_studmastAGE: TStringField
      FieldName = 'AGE'
      Origin = 'adm_studmast.AGE'
    end
    object adm_studmastNOTERMS: TFloatField
      FieldName = 'NOTERMS'
      Origin = 'adm_studmast.NOTERMS'
    end
    object adm_studmastPHONE: TStringField
      FieldName = 'PHONE'
      Origin = 'adm_studmast.PHONE'
    end
    object adm_studmastPHOTO: TBlobField
      FieldName = 'PHOTO'
      Origin = 'adm_studmast.PHOTO'
    end
    object adm_studmastEML: TStringField
      FieldName = 'EML'
      Origin = 'adm_studmast.EML'
      Size = 35
    end
    object adm_studmastM_PHONE: TStringField
      FieldName = 'M_PHONE'
      Origin = 'adm_studmast.M_PHONE'
    end
    object adm_studmastRELIGION: TStringField
      FieldName = 'RELIGION'
      Origin = 'adm_studmast.RELIGION'
      Size = 15
    end
    object adm_studmastCASTE: TStringField
      FieldName = 'CASTE'
      Origin = 'adm_studmast.CASTE'
      Size = 15
    end
    object adm_studmastNOFSB: TStringField
      FieldName = 'NOFSB'
      Size = 30
    end
    object adm_studmastF_OCCP: TStringField
      FieldName = 'F_OCCP'
      Origin = 'adm_studmast.F_OCCP'
      Size = 40
    end
    object adm_studmastF_QUAL: TStringField
      FieldName = 'F_QUAL'
      Origin = 'adm_studmast.F_QUAL'
      Size = 40
    end
    object adm_studmastM_QUAL: TStringField
      FieldName = 'M_QUAL'
      Origin = 'adm_studmast.M_QUAL'
    end
    object adm_studmastM_OCCP: TStringField
      FieldName = 'M_OCCP'
      Origin = 'adm_studmast.M_OCCP'
    end
    object adm_studmastSCHLAST: TStringField
      FieldName = 'SCHLAST'
      Origin = 'adm_studmast.SCHLAST'
      Size = 30
    end
    object adm_studmastBLOODGROUP: TStringField
      FieldName = 'BLOODGROUP'
      Origin = 'adm_studmast.BLOODGROUP'
      Size = 15
    end
    object adm_studmastHOUSE: TStringField
      FieldName = 'HOUSE'
      Origin = 'adm_studmast.HOUSE'
      Size = 25
    end
    object adm_studmastMTOUNGE: TStringField
      FieldName = 'MTOUNGE'
      Origin = 'adm_studmast.MTOUNGE'
      Size = 15
    end
    object adm_studmastBYBUS: TBooleanField
      FieldName = 'BYBUS'
      Origin = 'adm_studmast.BYBUS'
    end
    object adm_studmastREMARK: TMemoField
      FieldName = 'REMARK'
      Origin = 'adm_studmast.REMARK'
      BlobType = ftMemo
    end
    object adm_studmastUPGRDYR: TStringField
      FieldName = 'UPGRDYR'
      Origin = 'adm_studmast.UPGRDYR'
      Size = 2
    end
    object adm_studmastADM_CL: TSmallintField
      FieldName = 'ADM_CL'
      Origin = 'adm_studmast.ADM_CL'
    end
    object adm_studmastPATH: TStringField
      FieldName = 'PATH'
      Origin = 'adm_studmast.PATH'
      Size = 30
    end
    object adm_studmastAmd_cl_desc: TStringField
      FieldKind = fkLookup
      FieldName = 'Amd_cl_desc'
      LookupDataSet = ClMast
      LookupKeyFields = 'CLCODE'
      LookupResultField = 'DESCR'
      KeyFields = 'ADM_CL'
      Lookup = True
    end
    object adm_studmastcl_caption: TStringField
      FieldKind = fkLookup
      FieldName = 'cl_caption'
      LookupDataSet = ClMast
      LookupKeyFields = 'CLCODE'
      LookupResultField = 'CLCAPTION'
      KeyFields = 'CLCODE'
      Lookup = True
    end
    object adm_studmastcatDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'catDesc'
      LookupDataSet = catgrmast
      LookupKeyFields = 'CATCODE'
      LookupResultField = 'DESCR'
      KeyFields = 'CATCODE'
      Lookup = True
    end
    object adm_studmaststMfee: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'stMfee'
      LookupDataSet = ClMast
      LookupKeyFields = 'CLCODE'
      LookupResultField = 'MFEE'
      KeyFields = 'CLCODE'
      Lookup = True
    end
    object adm_studmaststClDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'stClDesc'
      LookupDataSet = ClMast
      LookupKeyFields = 'CLCODE'
      LookupResultField = 'DESCR'
      KeyFields = 'CLCODE'
      Lookup = True
    end
    object adm_studmastcage: TStringField
      FieldKind = fkCalculated
      FieldName = 'cage'
      Size = 40
      Calculated = True
    end
    object adm_studmastdbfilterstr: TStringField
      FieldKind = fkCalculated
      FieldName = 'dbfilterstr'
      Calculated = True
    end
    object adm_studmastFEE_PROF_CODE: TSmallintField
      FieldName = 'FEE_PROF_CODE'
    end
    object adm_studmastFEE_PROF_DESCR: TStringField
      FieldKind = fkLookup
      FieldName = 'FEE_PROF_DESCR'
      LookupDataSet = tbFeeProf
      LookupKeyFields = 'code'
      LookupResultField = 'descr'
      KeyFields = 'FEE_PROF_CODE'
      Lookup = True
    end
    object adm_studmastG_OCCP: TStringField
      FieldName = 'G_OCCP'
      Size = 40
    end
    object adm_studmastG_QUAL: TStringField
      FieldName = 'G_QUAL'
      Size = 40
    end
    object adm_studmastGREL: TIntegerField
      FieldName = 'GREL'
    end
    object adm_studmastGCOMP: TIntegerField
      FieldName = 'GCOMP'
    end
    object adm_studmastCMP_PNO: TStringField
      FieldName = 'CMP_PNO'
    end
    object adm_studmastCMP_DEPT: TStringField
      FieldName = 'CMP_DEPT'
      Size = 25
    end
    object adm_studmastRelDescr: TStringField
      FieldKind = fkLookup
      FieldName = 'RelDescr'
      LookupDataSet = tbRelmast
      LookupKeyFields = 'relcode'
      LookupResultField = 'relinfo'
      KeyFields = 'GREL'
      Lookup = True
    end
    object adm_studmastcomp: TStringField
      FieldKind = fkLookup
      FieldName = 'comp'
      LookupDataSet = tbComp
      LookupKeyFields = 'cmp_id'
      LookupResultField = 'cmpname'
      KeyFields = 'GCOMP'
      Lookup = True
    end
    object adm_studmastBSDT: TStringField
      FieldName = 'BSDT'
      Size = 12
    end
    object adm_studmastLIBFINE: TFloatField
      FieldName = 'LIBFINE'
    end
    object adm_studmastTRANSMODE: TStringField
      FieldName = 'TRANSMODE'
      Size = 25
    end
    object adm_studmastFSERVADDR: TMemoField
      FieldName = 'FSERVADDR'
      BlobType = ftMemo
    end
    object adm_studmastMSERVADDR: TMemoField
      FieldName = 'MSERVADDR'
      BlobType = ftMemo
    end
    object adm_studmastGSERVADDR: TMemoField
      FieldName = 'GSERVADDR'
      BlobType = ftMemo
    end
    object adm_studmasthandicap: TIntegerField
      FieldName = 'handicap'
    end
    object adm_studmastidmark: TStringField
      FieldName = 'idmark'
      Size = 25
    end
    object adm_studmastdisease: TStringField
      FieldName = 'disease'
      Size = 25
    end
    object adm_studmasthandicapDescr: TStringField
      FieldKind = fkLookup
      FieldName = 'handicapDescr'
      LookupDataSet = tbHandicap
      LookupKeyFields = 'id'
      LookupResultField = 'descr'
      KeyFields = 'handicap'
      Lookup = True
    end
    object adm_studmastrejected: TBooleanField
      FieldName = 'rejected'
    end
    object adm_studmastrej_reason: TStringField
      FieldName = 'rej_reason'
      Size = 45
    end
    object adm_studmastloc_id: TIntegerField
      FieldName = 'loc_id'
    end
    object adm_studmastloc_descr: TStringField
      FieldKind = fkLookup
      FieldName = 'loc_descr'
      LookupDataSet = tbLoc
      LookupKeyFields = 'loc_id'
      LookupResultField = 'location'
      KeyFields = 'loc_id'
      Lookup = True
    end
    object adm_studmastloc_dist: TFloatField
      FieldKind = fkLookup
      FieldName = 'loc_dist'
      LookupDataSet = tbLoc
      LookupKeyFields = 'loc_id'
      LookupResultField = 'dist'
      KeyFields = 'loc_id'
      Lookup = True
    end
    object adm_studmastuidno: TStringField
      FieldName = 'uidno'
      Size = 15
    end
  end
  object tbAdmstud_docs: TMyTable
    TableName = 'admstud_docs'
    MasterFields = 'STUDID'
    DetailFields = 'studid'
    MasterSource = adm_studmastS
    Connection = myconn
    Left = 136
    Top = 752
    object tbAdmstud_docsStudid: TFloatField
      FieldName = 'studid'
    end
    object tbAdmstud_docsdoc_code: TLargeintField
      FieldName = 'doc_code'
    end
    object tbAdmstud_docsScan_copy: TBlobField
      FieldName = 'scan_copy'
    end
    object tbAdmstud_docsdoc_descr: TStringField
      FieldKind = fkLookup
      FieldName = 'doc_descr'
      LookupDataSet = tbDoc_type
      LookupKeyFields = 'doc_code'
      LookupResultField = 'doc_descr'
      KeyFields = 'doc_code'
      Lookup = True
    end
  end
  object dsAdmstud_docs: TMyDataSource
    DataSet = tbAdmstud_docs
    Left = 40
    Top = 752
  end
  object qryCustom: TMyQuery
    Connection = myconn
    Left = 984
    Top = 208
  end
  object tbRoles: TMyTable
    TableName = 'sm_roles'
    Connection = myconn
    Left = 840
    Top = 680
    object tbRolesrole_id: TLargeintField
      FieldName = 'role_id'
    end
    object tbRolesrole: TStringField
      FieldName = 'role'
    end
  end
  object tbHandicap: TMyTable
    TableName = 'sm_handicap'
    Connection = myconn
    Left = 296
    Top = 752
    object tbHandicapid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'sm_handicap.id'
    end
    object tbHandicapdescr: TStringField
      FieldName = 'descr'
      Origin = 'sm_handicap.descr'
      Size = 30
    end
  end
  object dsHandicap: TMyDataSource
    DataSet = tbHandicap
    Left = 224
    Top = 752
  end
  object dsLoc: TMyDataSource
    DataSet = tbLoc
    Left = 368
    Top = 600
  end
  object tbLoc: TMyTable
    TableName = 'sm_locmast'
    Connection = myconn
    Left = 432
    Top = 598
    object tbLocloc_id: TIntegerField
      FieldName = 'loc_id'
    end
    object tbLoclocation: TStringField
      FieldName = 'location'
      Size = 15
    end
    object tbLocdist: TSmallintField
      FieldName = 'dist'
    end
    object tbLocdist_range: TStringField
      FieldName = 'dist_range'
      Size = 15
    end
  end
  object dsTcstatus: TMyDataSource
    DataSet = tcstatus
    Left = 368
    Top = 656
  end
  object tcstatus: TMyTable
    TableName = 'sm_tcstatus'
    Connection = myconn
    Left = 432
    Top = 654
    object tcstatusid: TIntegerField
      FieldName = 'id'
      Origin = 'sm_tcstatus.id'
    end
    object tcstatustcstatus: TStringField
      FieldName = 'tcstatus'
      Origin = 'sm_tcstatus.tcstatus'
      Size = 15
    end
  end
  object dsTrans: TMyDataSource
    DataSet = tbTrans
    Left = 224
    Top = 648
  end
  object tbTrans: TMyTable
    TableName = 'trans'
    Connection = myconn
    Left = 296
    Top = 646
    object tbTranstransno: TIntegerField
      FieldName = 'transno'
    end
    object tbTransItemCode: TIntegerField
      FieldName = 'ItemCode'
    end
    object tbTransAmount: TFloatField
      FieldName = 'Amount'
    end
    object tbTranstrDate: TDateField
      FieldName = 'trDate'
    end
    object tbTransItemDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'ItemDesc'
      LookupDataSet = tbItems
      LookupKeyFields = 'ItemCode'
      LookupResultField = 'Descr'
      KeyFields = 'ItemCode'
      Lookup = True
    end
    object tbTransItemRte: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'ItemRte'
      LookupDataSet = tbItems
      LookupKeyFields = 'ItemCode'
      LookupResultField = 'Rte'
      KeyFields = 'ItemCode'
      Lookup = True
    end
  end
  object dsItems: TMyDataSource
    DataSet = tbItems
    Left = 376
    Top = 496
  end
  object tbItems: TMyTable
    TableName = 'items'
    Connection = myconn
    Left = 440
    Top = 494
    object tbItemsItemCode: TIntegerField
      FieldName = 'ItemCode'
    end
    object tbItemsDescr: TStringField
      FieldName = 'Descr'
      Size = 25
    end
    object tbItemsRte: TFloatField
      FieldName = 'Rte'
    end
  end
  object adm_studmastXIS: TMyDataSource
    DataSet = adm_studmastXI
    Left = 40
    Top = 648
  end
  object adm_studmastXI: TMyTable
    TableName = 'adm_studmastxi'
    Connection = myconn
    AfterOpen = adm_studmastXIAfterEdit
    AfterInsert = adm_studmastXIAfterInsert
    AfterEdit = adm_studmastXIAfterEdit
    BeforePost = adm_studmastXIBeforePost
    AfterPost = adm_studmastXIAfterEdit
    AfterCancel = adm_studmastXIAfterEdit
    AfterDelete = adm_studmastXIAfterEdit
    OnCalcFields = adm_studmastXICalcFields
    Left = 136
    Top = 648
    object adm_studmastXISTUDID: TFloatField
      FieldName = 'STUDID'
    end
    object adm_studmastXIADMNO: TStringField
      FieldName = 'ADMNO'
      Size = 10
    end
    object adm_studmastXINAME: TStringField
      FieldName = 'NAME'
      Size = 40
    end
    object adm_studmastXICLCODE: TWordField
      FieldName = 'CLCODE'
    end
    object adm_studmastXIROLLNO: TFloatField
      FieldName = 'ROLLNO'
    end
    object adm_studmastXISECTION: TStringField
      FieldName = 'SECTION'
      Size = 2
    end
    object adm_studmastXIDOB: TDateField
      FieldName = 'DOB'
    end
    object adm_studmastXISEX: TStringField
      FieldName = 'SEX'
      Size = 1
    end
    object adm_studmastXIGNAME: TStringField
      FieldName = 'GNAME'
      Size = 40
    end
    object adm_studmastXIFNAME: TStringField
      FieldName = 'FNAME'
      Size = 40
    end
    object adm_studmastXIMNAME: TStringField
      FieldName = 'MNAME'
      Size = 40
    end
    object adm_studmastXILADDR: TMemoField
      FieldName = 'LADDR'
      BlobType = ftMemo
    end
    object adm_studmastXIPADDR: TMemoField
      FieldName = 'PADDR'
      BlobType = ftMemo
    end
    object adm_studmastXICATCODE: TFloatField
      FieldName = 'CATCODE'
    end
    object adm_studmastXIDOA: TDateField
      FieldName = 'DOA'
    end
    object adm_studmastXIAGE: TStringField
      FieldName = 'AGE'
    end
    object adm_studmastXIPHOTO: TBlobField
      FieldName = 'PHOTO'
    end
    object adm_studmastXINOTERMS: TFloatField
      FieldName = 'NOTERMS'
    end
    object adm_studmastXIPHONE: TStringField
      FieldName = 'PHONE'
    end
    object adm_studmastXIEML: TStringField
      FieldName = 'EML'
      Size = 35
    end
    object adm_studmastXIM_PHONE: TStringField
      FieldName = 'M_PHONE'
    end
    object adm_studmastXIRELIGION: TStringField
      FieldName = 'RELIGION'
      Size = 15
    end
    object adm_studmastXICASTE: TStringField
      FieldName = 'CASTE'
      Size = 15
    end
    object adm_studmastXINOFSB: TStringField
      FieldName = 'NOFSB'
      Size = 40
    end
    object adm_studmastXIF_OCCP: TStringField
      FieldName = 'F_OCCP'
      Size = 40
    end
    object adm_studmastXIF_QUAL: TStringField
      FieldName = 'F_QUAL'
      Size = 40
    end
    object adm_studmastXIM_QUAL: TStringField
      FieldName = 'M_QUAL'
    end
    object adm_studmastXIM_OCCP: TStringField
      FieldName = 'M_OCCP'
    end
    object adm_studmastXISCHLAST: TStringField
      FieldName = 'SCHLAST'
      Size = 30
    end
    object adm_studmastXIBLOODGROUP: TStringField
      FieldName = 'BLOODGROUP'
      Size = 15
    end
    object adm_studmastXIHOUSE: TStringField
      FieldName = 'HOUSE'
      Size = 25
    end
    object adm_studmastXIMTOUNGE: TStringField
      FieldName = 'MTOUNGE'
      Size = 15
    end
    object adm_studmastXIBYBUS: TBooleanField
      FieldName = 'BYBUS'
    end
    object adm_studmastXIREMARK: TMemoField
      FieldName = 'REMARK'
      BlobType = ftMemo
    end
    object adm_studmastXIUPGRDYR: TStringField
      FieldName = 'UPGRDYR'
      Size = 2
    end
    object adm_studmastXIADM_CL: TWordField
      FieldName = 'ADM_CL'
    end
    object adm_studmastXIPATH: TStringField
      FieldName = 'PATH'
      Size = 30
    end
    object adm_studmastXIBSDT: TStringField
      FieldName = 'BSDT'
      Size = 12
    end
    object adm_studmastXILIBFINE: TFloatField
      FieldName = 'LIBFINE'
    end
    object adm_studmastXITRANSMODE: TStringField
      FieldName = 'TRANSMODE'
      Size = 25
    end
    object adm_studmastXIG_OCCP: TStringField
      FieldName = 'G_OCCP'
      Size = 40
    end
    object adm_studmastXIG_QUAL: TStringField
      FieldName = 'G_QUAL'
      Size = 40
    end
    object adm_studmastXIFSERVADDR: TMemoField
      FieldName = 'FSERVADDR'
      BlobType = ftMemo
    end
    object adm_studmastXIMSERVADDR: TMemoField
      FieldName = 'MSERVADDR'
      BlobType = ftMemo
    end
    object adm_studmastXIGSERVADDR: TMemoField
      FieldName = 'GSERVADDR'
      BlobType = ftMemo
    end
    object adm_studmastXIFEE_PROF_CODE: TSmallintField
      FieldName = 'FEE_PROF_CODE'
    end
    object adm_studmastXIGREL: TIntegerField
      FieldName = 'GREL'
    end
    object adm_studmastXIGCOMP: TIntegerField
      FieldName = 'GCOMP'
    end
    object adm_studmastXICMP_PNO: TStringField
      FieldName = 'CMP_PNO'
    end
    object adm_studmastXICMP_DEPT: TStringField
      FieldName = 'CMP_DEPT'
      Size = 25
    end
    object adm_studmastXIhandicap: TIntegerField
      FieldName = 'handicap'
    end
    object adm_studmastXIidmark: TStringField
      FieldName = 'idmark'
      Size = 25
    end
    object adm_studmastXIdisease: TStringField
      FieldName = 'disease'
      Size = 25
    end
    object adm_studmastXIrejected: TBooleanField
      FieldName = 'rejected'
    end
    object adm_studmastXIrej_reason: TStringField
      FieldName = 'rej_reason'
      Size = 45
    end
    object adm_studmastXIcatDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'catDesc'
      LookupDataSet = catgrmast
      LookupKeyFields = 'CATCODE'
      LookupResultField = 'DESCR'
      KeyFields = 'CATCODE'
      Lookup = True
    end
    object adm_studmastXIcomp: TStringField
      FieldKind = fkLookup
      FieldName = 'comp'
      LookupDataSet = tbComp
      LookupKeyFields = 'cmp_id'
      LookupResultField = 'cmpname'
      KeyFields = 'GCOMP'
      Lookup = True
    end
    object adm_studmastXIhandicapDescr: TStringField
      FieldKind = fkLookup
      FieldName = 'handicapDescr'
      LookupDataSet = tbHandicap
      LookupKeyFields = 'id'
      LookupResultField = 'descr'
      KeyFields = 'handicap'
      Lookup = True
    end
    object adm_studmastXIcage: TStringField
      FieldKind = fkCalculated
      FieldName = 'cage'
      Size = 40
      Calculated = True
    end
    object adm_studmastXIRelDescr: TStringField
      FieldKind = fkLookup
      FieldName = 'RelDescr'
      LookupDataSet = tbRelmast
      LookupKeyFields = 'relcode'
      LookupResultField = 'relinfo'
      KeyFields = 'GREL'
      Lookup = True
    end
    object adm_studmastXIloc_id: TIntegerField
      FieldName = 'loc_id'
    end
    object adm_studmastXIadm_subcode: TStringField
      FieldName = 'adm_subcode'
      Size = 3
    end
    object adm_studmastXIadm_subdescr: TStringField
      FieldKind = fkLookup
      FieldName = 'adm_subdescr'
      LookupDataSet = tbAdmxi_subj
      LookupKeyFields = 'subcode'
      LookupResultField = 'subdescr'
      KeyFields = 'adm_subcode'
      Size = 60
      Lookup = True
    end
    object adm_studmastXIadm_optsubj: TStringField
      FieldKind = fkLookup
      FieldName = 'adm_optsubj'
      LookupDataSet = tbAdmxi_subj
      LookupKeyFields = 'subcode'
      LookupResultField = 'optsubj'
      KeyFields = 'adm_subcode'
      Size = 30
      Lookup = True
    end
    object adm_studmastXIuidno: TStringField
      FieldName = 'uidno'
      Size = 15
    end
    object adm_studmastXIboard: TStringField
      FieldName = 'board'
      Size = 15
    end
  end
  object tbAdmstud_docsXI: TMyTable
    TableName = 'admstud_docsXI'
    MasterFields = 'STUDID'
    DetailFields = 'studid'
    MasterSource = adm_studmastXIS
    Connection = myconn
    Left = 136
    Top = 600
    object tbAdmstud_docsXIstudid: TFloatField
      FieldName = 'studid'
    end
    object tbAdmstud_docsXIdoc_code: TLargeintField
      FieldName = 'doc_code'
    end
    object tbAdmstud_docsXIscan_copy: TBlobField
      FieldName = 'scan_copy'
    end
    object tbAdmstud_docsXIdoc_descr: TStringField
      FieldKind = fkLookup
      FieldName = 'doc_descr'
      LookupDataSet = tbDoc_type
      LookupKeyFields = 'doc_code'
      LookupResultField = 'doc_descr'
      KeyFields = 'doc_code'
      Lookup = True
    end
  end
  object dsAdmstud_docsXI: TMyDataSource
    DataSet = tbAdmstud_docsXI
    Left = 40
    Top = 600
  end
  object tbAdmxi_subj: TMyTable
    TableName = 'admxi_subj'
    Connection = myconn
    Left = 296
    Top = 600
    object tbAdmxi_subjsubcode: TStringField
      FieldName = 'subcode'
      Size = 5
    end
    object tbAdmxi_subjsubdescr: TStringField
      FieldName = 'subdescr'
      Size = 55
    end
    object tbAdmxi_subjoptsubj: TStringField
      FieldName = 'optsubj'
      Size = 15
    end
  end
  object dsAdmxi_subj: TMyDataSource
    DataSet = tbAdmxi_subj
    Left = 224
    Top = 600
  end
  object tbRepMast: TMyTable
    TableName = 'sm_repmast'
    Connection = myconn
    Left = 432
    Top = 704
    object tbRepMastrepid: TIntegerField
      FieldName = 'repid'
    end
    object tbRepMastrep_head: TStringField
      FieldName = 'rep_head'
      Size = 25
    end
    object tbRepMastrep_sql: TMemoField
      FieldName = 'rep_sql'
      BlobType = ftMemo
    end
  end
  object dsRepMast: TMyDataSource
    DataSet = tbRepMast
    Left = 368
    Top = 704
  end
  object dsAdhocSQL: TMyDataSource
    DataSet = qryAdHocSQL
    Left = 616
    Top = 472
  end
  object qryAdHocSQL: TMyQuery
    Connection = myconn
    Left = 616
    Top = 416
  end
  object frxDBAdmStudXI: TfrxDBDataset
    UserName = 'frxDBAdmStudXI'
    CloseDataSource = False
    FieldAliases.Strings = (
      'STUDID=STUDID'
      'ADMNO=ADMNO'
      'NAME=NAME'
      'CLCODE=CLCODE'
      'ROLLNO=ROLLNO'
      'SECTION=SECTION'
      'DOB=DOB'
      'SEX=SEX'
      'GNAME=GNAME'
      'FNAME=FNAME'
      'MNAME=MNAME'
      'LADDR=LADDR'
      'PADDR=PADDR'
      'CATCODE=CATCODE'
      'DOA=DOA'
      'AGE=AGE'
      'PHOTO=PHOTO'
      'NOTERMS=NOTERMS'
      'PHONE=PHONE'
      'EML=EML'
      'M_PHONE=M_PHONE'
      'RELIGION=RELIGION'
      'CASTE=CASTE'
      'NOFSB=NOFSB'
      'F_OCCP=F_OCCP'
      'F_QUAL=F_QUAL'
      'M_QUAL=M_QUAL'
      'M_OCCP=M_OCCP'
      'SCHLAST=SCHLAST'
      'BLOODGROUP=BLOODGROUP'
      'HOUSE=HOUSE'
      'MTOUNGE=MTOUNGE'
      'BYBUS=BYBUS'
      'REMARK=REMARK'
      'UPGRDYR=UPGRDYR'
      'ADM_CL=ADM_CL'
      'PATH=PATH'
      'BSDT=BSDT'
      'LIBFINE=LIBFINE'
      'TRANSMODE=TRANSMODE'
      'G_OCCP=G_OCCP'
      'G_QUAL=G_QUAL'
      'FSERVADDR=FSERVADDR'
      'MSERVADDR=MSERVADDR'
      'GSERVADDR=GSERVADDR'
      'FEE_PROF_CODE=FEE_PROF_CODE'
      'GREL=GREL'
      'GCOMP=GCOMP'
      'CMP_PNO=CMP_PNO'
      'CMP_DEPT=CMP_DEPT'
      'handicap=handicap'
      'idmark=idmark'
      'disease=disease'
      'rejected=rejected'
      'rej_reason=rej_reason'
      'catDesc=catDesc'
      'comp=comp'
      'handicapDescr=handicapDescr'
      'cage=cage'
      'RelDescr=RelDescr'
      'loc_id=loc_id'
      'adm_subcode=adm_subcode'
      'adm_subdescr=adm_subdescr'
      'adm_optsubj=adm_optsubj')
    DataSource = adm_studmastXIS
    BCDToCurrency = False
    Left = 984
    Top = 400
  end
  object frxRichObject1: TfrxRichObject
    Left = 800
    Top = 520
  end
  object sp_age_filter: TMyStoredProc
    StoredProcName = 'sp_age_filter'
    Connection = myconn
    SQL.Strings = (
      'CALL sp_age_filter(:cdate)')
    Left = 528
    Top = 280
    ParamData = <
      item
        DataType = ftDate
        Name = 'cdate'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'sp_age_filter'
  end
  object qryChqSearch: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'select studmast.NAME,studmast.FNAME,CLCAPTION,studmast.SECTION,b' +
        'mast.DESCR bank,BRANCH,'
      
        'CHQ_NO,CHQ_AMT,MR_NO,MR_DATE,studmast.admno,NOTERM,FEE_AMT,chk_l' +
        'astmr(MR_NO) Lastfee,m_phone'
      ' from fee'
      'inner join studmast on fee.STUDID=studmast.STUDID'
      'inner join clmast on studmast.CLCODE=clmast.CLCODE'
      'inner join bmast on fee.DRAWN_ON=bmast.BCODE'
      'where CHQ_NO=:chq_no and fee.drawn_on=:bcode '
      'order by MR_DATE desc,MR_NO desc')
    Left = 137
    Top = 704
    ParamData = <
      item
        DataType = ftString
        Name = 'chq_no'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'bcode'
        ParamType = ptInput
        Value = nil
      end>
    object qryChqSearchNAME: TStringField
      FieldName = 'NAME'
      Size = 40
    end
    object qryChqSearchFNAME: TStringField
      FieldName = 'FNAME'
      Size = 40
    end
    object qryChqSearchCLCAPTION: TStringField
      FieldName = 'CLCAPTION'
      Size = 10
    end
    object qryChqSearchSECTION: TStringField
      FieldName = 'SECTION'
      Size = 2
    end
    object qryChqSearchbank: TStringField
      FieldName = 'bank'
      Size = 30
    end
    object qryChqSearchBRANCH: TSmallintField
      FieldName = 'BRANCH'
    end
    object qryChqSearchCHQ_NO: TStringField
      FieldName = 'CHQ_NO'
      Size = 2
    end
    object qryChqSearchCHQ_AMT: TFloatField
      FieldName = 'CHQ_AMT'
    end
    object qryChqSearchMR_NO: TStringField
      FieldName = 'MR_NO'
      Size = 14
    end
    object qryChqSearchMR_DATE: TDateField
      FieldName = 'MR_DATE'
    end
    object qryChqSearchadmno: TStringField
      FieldName = 'admno'
      Size = 10
    end
    object qryChqSearchNOTERM: TFloatField
      FieldName = 'NOTERM'
    end
    object qryChqSearchFEE_AMT: TFloatField
      FieldName = 'FEE_AMT'
    end
    object qryChqSearchLastfee: TBooleanField
      FieldName = 'Lastfee'
    end
    object qryChqSearchm_phone: TStringField
      FieldName = 'm_phone'
    end
  end
  object qryChqSearchS: TMyDataSource
    DataSet = qryChqSearch
    Left = 40
    Top = 704
  end
  object frxDBtcdata: TfrxDBDataset
    UserName = 'frxDBtcdata'
    CloseDataSource = False
    FieldAliases.Strings = (
      'sadmno=sAdmno'
      'sname=SNAME'
      'sfname=SFNAME'
      'sdob=SDOB'
      'sdoa=SDOA'
      'sclass=sClass'
      'saclass=saclass'
      'sschool=SSCHOOL'
      'scaste=scaste'
      'slno=SLNO'
      'tcno=TCNO'
      'dtleft=DTLEFT'
      'charactr=CHARACTR'
      'yrfrom=YRFROM'
      'yrto=YRTO'
      'tcdate=TCDATE'
      'promotion=PROMOTION'
      'oinfo=OINFO'
      'reason=reason'
      'schboard=schboard'
      'failed=failed'
      'subject=subject'
      'prom=prom'
      'promo_for=promo_for'
      'fee_upto=fee_upto'
      'work_days=work_days'
      'present_days=present_days'
      'ncc=NCC'
      'games=games'
      'conduct=conduct'
      'doi=doi'
      'feeprof=feeprof'
      'clword=clword'
      'c_feecat=c_feecat'
      'dobinword=dobinword'
      'doa=doa'
      'mnthyr=mnthyr'
      'sex=sex'
      'appexam=appexam')
    OpenDataSource = False
    DataSet = qryTcdata
    BCDToCurrency = False
    Left = 640
    Top = 624
  end
  object tbAdm_final: TMyTable
    TableName = 'sm_admfinal'
    Connection = myconn
    Left = 296
    Top = 544
    object tbAdm_finalstudid: TFloatField
      FieldName = 'studid'
    end
    object tbAdm_finalstudname: TStringField
      FieldKind = fkLookup
      FieldName = 'studname'
      LookupDataSet = adm_studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'NAME'
      KeyFields = 'studid'
      Size = 35
      Lookup = True
    end
    object tbAdm_finalstudfname: TStringField
      FieldKind = fkLookup
      FieldName = 'studfname'
      LookupDataSet = adm_studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'FNAME'
      KeyFields = 'studid'
      Size = 30
      Lookup = True
    end
  end
  object dsAdm_final: TMyDataSource
    DataSet = tbAdm_final
    Left = 224
    Top = 544
  end
  object mysp_transfer: TMyStoredProc
    StoredProcName = 'sp_transfer'
    Connection = myconn
    SQL.Strings = (
      'CALL sp_transfer(:p_regno)')
    Left = 528
    Top = 232
    ParamData = <
      item
        DataType = ftFloat
        Name = 'p_regno'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'sp_transfer'
  end
  object qryTcdata: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'select s.admno sadmno,s.name sname,s.fname sfname,s.dob sdob,s.d' +
        'oa sdoa,'
      
        'concat(c.clcaption,'#39' '#39',section) sclass,ca.clcaption saclass,s.sc' +
        'hlast sschool,s.caste scaste,'
      'slno,tcno,dtleft,charactr,yrfrom,yrto,tcdate,promotion,oinfo,'
      
        'reason,schboard,failed,subject,prom,promo_for,fee_upto,work_days' +
        ',f.descr feeprof,'
      
        'present_days,ncc,games,conduct,doi,t.doa,mnthyr,sex,appexam from' +
        ' tcdata t'
      'inner join studmast s on t.admno=s.studid'
      'inner join clmast c on s.clcode=c.clcode'
      'left join clmast ca on s.adm_cl=ca.clcode'
      'inner join fee_prof f on s.fee_prof_code=f.code')
    OnCalcFields = qryTcdataCalcFields
    Left = 849
    Top = 208
    object qryTcdatasadmno: TStringField
      FieldName = 'sadmno'
      Size = 10
    end
    object qryTcdatasname: TStringField
      FieldName = 'sname'
      Size = 40
    end
    object qryTcdatasfname: TStringField
      FieldName = 'sfname'
      Size = 40
    end
    object qryTcdatasdob: TDateField
      FieldName = 'sdob'
    end
    object qryTcdatasdoa: TDateField
      FieldName = 'sdoa'
    end
    object qryTcdatasclass: TStringField
      FieldName = 'sclass'
      Size = 10
    end
    object qryTcdatasaclass: TStringField
      FieldName = 'saclass'
      Size = 10
    end
    object qryTcdatasschool: TStringField
      FieldName = 'sschool'
      Size = 30
    end
    object qryTcdatascaste: TStringField
      FieldName = 'scaste'
      Size = 15
    end
    object qryTcdataslno: TFloatField
      FieldName = 'slno'
    end
    object qryTcdatatcno: TIntegerField
      FieldName = 'tcno'
    end
    object qryTcdatadtleft: TDateField
      FieldName = 'dtleft'
    end
    object qryTcdatacharactr: TStringField
      FieldName = 'charactr'
      Size = 15
    end
    object qryTcdatayrfrom: TStringField
      FieldName = 'yrfrom'
      Size = 15
    end
    object qryTcdatayrto: TStringField
      FieldName = 'yrto'
      Size = 15
    end
    object qryTcdatatcdate: TDateField
      FieldName = 'tcdate'
    end
    object qryTcdatapromotion: TStringField
      FieldName = 'promotion'
      Size = 15
    end
    object qryTcdataoinfo: TMemoField
      FieldName = 'oinfo'
      BlobType = ftMemo
    end
    object qryTcdatareason: TStringField
      FieldName = 'reason'
      Size = 30
    end
    object qryTcdataschboard: TStringField
      FieldName = 'schboard'
      Size = 40
    end
    object qryTcdatafailed: TStringField
      FieldName = 'failed'
      FixedChar = True
      Size = 3
    end
    object qryTcdatasubject: TStringField
      FieldName = 'subject'
      Size = 50
    end
    object qryTcdataprom: TStringField
      FieldName = 'prom'
      FixedChar = True
      Size = 3
    end
    object qryTcdatapromo_for: TStringField
      FieldName = 'promo_for'
      Size = 25
    end
    object qryTcdatafee_upto: TStringField
      FieldName = 'fee_upto'
      Size = 25
    end
    object qryTcdatawork_days: TIntegerField
      FieldName = 'work_days'
    end
    object qryTcdatapresent_days: TIntegerField
      FieldName = 'present_days'
    end
    object qryTcdatancc: TStringField
      FieldName = 'ncc'
      FixedChar = True
      Size = 3
    end
    object qryTcdatagames: TStringField
      FieldName = 'games'
      Size = 25
    end
    object qryTcdataconduct: TStringField
      FieldName = 'conduct'
      Size = 25
    end
    object qryTcdatadoi: TDateField
      FieldName = 'doi'
    end
    object qryTcdatafeeprof: TStringField
      FieldName = 'feeprof'
      Size = 30
    end
    object qryTcdataclword: TStringField
      FieldKind = fkCalculated
      FieldName = 'clword'
      Size = 100
      Calculated = True
    end
    object qryTcdatac_feecat: TStringField
      FieldKind = fkCalculated
      FieldName = 'c_feecat'
      Size = 100
      Calculated = True
    end
    object qryTcdatadobinword: TStringField
      FieldKind = fkCalculated
      FieldName = 'dobinword'
      Size = 100
      Calculated = True
    end
    object qryTcdatadoa: TDateField
      FieldName = 'doa'
    end
    object qryTcdatamnthyr: TStringField
      FieldName = 'mnthyr'
    end
    object qryTcdatasex: TStringField
      FieldName = 'sex'
      Size = 1
    end
    object qryTcdataappexam: TStringField
      FieldName = 'appexam'
      Size = 25
    end
  end
  object tbJps_fee: TMyTable
    TableName = 'jps_fee'
    Connection = myconn
    Left = 992
    Top = 24
    object tbJps_feeyr: TWordField
      FieldName = 'yr'
    end
    object tbJps_feecdep: TFloatField
      FieldName = 'cdep'
    end
    object tbJps_feeadep: TFloatField
      FieldName = 'adep'
    end
  end
  object qryFeeBank: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'select DRAWN_ON,b.DESCR,CHQ_NO,CHQ_AMT,GROUP_CONCAT(concat(f.STU' +
        'DID,'#39' '#39',s.name,'#39'\n'#39')) '
      'ids from fee f'
      '   inner join bmast b on f.DRAWN_ON=b.BCODE '
      '   inner join studmast s on f.studid=s.studid '
      'WHERE  f.CHQ_NO <> '#39#39' and f.chq_amt is not null'
      'and MR_DATE between :sdate and :edate'
      'group by DRAWN_ON,CHQ_NO,CHQ_AMT')
    Left = 745
    Top = 408
    ParamData = <
      item
        DataType = ftDate
        Name = 'sdate'
        Value = nil
      end
      item
        DataType = ftDate
        Name = 'edate'
        Value = nil
      end>
    object qryFeeBankDRAWN_ON: TSmallintField
      FieldName = 'DRAWN_ON'
    end
    object qryFeeBankDESCR: TStringField
      FieldName = 'DESCR'
      Size = 30
    end
    object qryFeeBankCHQ_NO: TStringField
      FieldName = 'CHQ_NO'
    end
    object qryFeeBankCHQ_AMT: TFloatField
      FieldName = 'CHQ_AMT'
    end
    object qryFeeBankids: TMemoField
      FieldName = 'ids'
      BlobType = ftMemo
    end
  end
  object frxDBqryFeeBank: TfrxDBDataset
    UserName = 'frxDBqryFeeBank'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DRAWN_ON=DRAWN_ON'
      'DESCR=DESCR'
      'CHQ_NO=CHQ_NO'
      'CHQ_AMT=CHQ_AMT'
      'ids=ids')
    DataSet = qryFeeBank
    BCDToCurrency = False
    Left = 752
    Top = 669
  end
  object qryStudAttnd: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'select a.studid,s.ADMNO,s.`NAME`,clcaption class,section,rollno ' +
        'from studattend a'
      'inner join studmast s on a.studid=s.STUDID'
      'inner join clmast c on c.clcode=s.clcode'
      'order by class,section,rollno')
    Left = 784
    Top = 304
    object qryStudAttndADMNO: TStringField
      FieldName = 'ADMNO'
      Size = 10
    end
    object qryStudAttndNAME: TStringField
      FieldName = 'NAME'
      Size = 40
    end
    object qryStudAttndclass: TStringField
      FieldName = 'class'
      Size = 10
    end
    object qryStudAttndsection: TStringField
      FieldName = 'section'
      Size = 2
    end
    object qryStudAttndrollno: TFloatField
      FieldName = 'rollno'
    end
    object qryStudAttndstudid: TLargeintField
      FieldName = 'studid'
    end
  end
  object qryStudAttndS: TMyDataSource
    DataSet = qryStudAttnd
    Left = 864
    Top = 296
  end
  object fees_duedtS: TMyDataSource
    DataSet = fees_duedt
    Left = 504
    Top = 808
  end
  object fees_duedt: TMyTable
    TableName = 'sm_fees_duedt'
    Connection = myconn
    Left = 576
    Top = 808
    object fees_duedtmnth: TWordField
      FieldName = 'mnth'
    end
    object fees_duedtfee_dt: TWordField
      FieldName = 'fee_dt'
    end
  end
  object qryChqdet: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'select admno,name,fee_amt,chq_amt,chq_no,bmast.descr bank,brmast' +
        '.descr branch from fee'
      'left join bmast on fee.DRAWN_ON=bmast.BCODE'
      'left join brmast on fee.BRANCH=brmast.BCODE'
      'inner join studmast on fee.STUDID=studmast.STUDID'
      'where chq_no=:chqno and fee.DRAWN_ON=:bcd')
    Left = 664
    Top = 808
    ParamData = <
      item
        DataType = ftString
        Name = 'chqno'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'bcd'
        Value = nil
      end>
    object qryChqdetadmno: TStringField
      FieldName = 'admno'
      Size = 10
    end
    object qryChqdetname: TStringField
      FieldName = 'name'
      Size = 40
    end
    object qryChqdetfee_amt: TFloatField
      FieldName = 'fee_amt'
    end
    object qryChqdetchq_amt: TFloatField
      FieldName = 'chq_amt'
    end
    object qryChqdetchq_no: TStringField
      FieldName = 'chq_no'
    end
    object qryChqdetbank: TStringField
      FieldName = 'bank'
      Size = 30
    end
    object qryChqdetbranch: TStringField
      FieldName = 'branch'
      Size = 30
    end
  end
  object dsAdm_finalxi: TMyDataSource
    DataSet = tbAdm_finalxi
    Left = 536
    Top = 736
  end
  object tbAdm_finalxi: TMyTable
    TableName = 'sm_admfinalxi'
    Connection = myconn
    Left = 608
    Top = 736
    object tbAdm_finalxistudid: TFloatField
      FieldName = 'studid'
    end
    object tbadm_finalxistudname: TStringField
      FieldKind = fkLookup
      FieldName = 'studname'
      LookupDataSet = adm_studmastXI
      LookupKeyFields = 'STUDID'
      LookupResultField = 'NAME'
      KeyFields = 'studid'
      Size = 35
      Lookup = True
    end
    object tbadm_finalxistudfname: TStringField
      FieldKind = fkLookup
      FieldName = 'studfname'
      LookupDataSet = adm_studmastXI
      LookupKeyFields = 'STUDID'
      LookupResultField = 'FNAME'
      KeyFields = 'studid'
      Size = 30
      Lookup = True
    end
  end
  object mysp_transferxi: TMyStoredProc
    StoredProcName = 'sp_transferxi'
    Connection = myconn
    SQL.Strings = (
      'CALL sp_transferxi(:p_regno)')
    Left = 528
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_regno'
        ParamType = ptInput
        Value = nil
      end>
    CommandStoredProcName = 'sp_transferxi'
  end
  object frxDBAdmStud: TfrxDBDataset
    UserName = 'frxDBAdmStud'
    CloseDataSource = False
    FieldAliases.Strings = (
      'STUDID=STUDID'
      'ADMNO=ADMNO'
      'NAME=NAME'
      'CLCODE=CLCODE'
      'ROLLNO=ROLLNO'
      'SECTION=SECTION'
      'DOB=DOB'
      'SEX=SEX'
      'GNAME=GNAME'
      'FNAME=FNAME'
      'MNAME=MNAME'
      'LADDR=LADDR'
      'PADDR=PADDR'
      'CATCODE=CATCODE'
      'DOA=DOA'
      'AGE=AGE'
      'NOTERMS=NOTERMS'
      'PHONE=PHONE'
      'PHOTO=PHOTO'
      'EML=EML'
      'M_PHONE=M_PHONE'
      'RELIGION=RELIGION'
      'CASTE=CASTE'
      'NOFSB=NOFSB'
      'F_OCCP=F_OCCP'
      'F_QUAL=F_QUAL'
      'M_QUAL=M_QUAL'
      'M_OCCP=M_OCCP'
      'SCHLAST=SCHLAST'
      'BLOODGROUP=BLOODGROUP'
      'HOUSE=HOUSE'
      'MTOUNGE=MTOUNGE'
      'BYBUS=BYBUS'
      'REMARK=REMARK'
      'UPGRDYR=UPGRDYR'
      'ADM_CL=ADM_CL'
      'PATH=PATH'
      'Amd_cl_desc=Amd_cl_desc'
      'cl_caption=cl_caption'
      'catDesc=catDesc'
      'stMfee=stMfee'
      'stClDesc=stClDesc'
      'cage=cage'
      'dbfilterstr=dbfilterstr'
      'FEE_PROF_CODE=FEE_PROF_CODE'
      'FEE_PROF_DESCR=FEE_PROF_DESCR'
      'G_OCCP=G_OCCP'
      'G_QUAL=G_QUAL'
      'GREL=GREL'
      'GCOMP=GCOMP'
      'CMP_PNO=CMP_PNO'
      'CMP_DEPT=CMP_DEPT'
      'RelDescr=RelDescr'
      'comp=comp'
      'BSDT=BSDT'
      'LIBFINE=LIBFINE'
      'TRANSMODE=TRANSMODE'
      'FSERVADDR=FSERVADDR'
      'MSERVADDR=MSERVADDR'
      'GSERVADDR=GSERVADDR'
      'handicap=handicap'
      'idmark=idmark'
      'disease=disease'
      'handicapDescr=handicapDescr'
      'rejected=rejected'
      'rej_reason=rej_reason'
      'loc_id=loc_id'
      'loc_descr=loc_descr'
      'loc_dist=loc_dist'
      'uidno=uidno')
    DataSource = adm_studmastS
    BCDToCurrency = False
    Left = 952
    Top = 472
  end
  object frxDBstudmast: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'frxDBstudmast'
    CloseDataSource = False
    FieldAliases.Strings = (
      'STUDID=StudID'
      'ADMNO=ADMNO'
      'NAME=Name'
      'CLCODE=clcode'
      'ROLLNO=RollNo'
      'SECTION=Section'
      'DOB=DOB'
      'SEX=Sex'
      'GNAME=GName'
      'FNAME=Fname'
      'MNAME=Mname'
      'LADDR=LAddr'
      'PADDR=PAddr'
      'CATCODE=CatCode'
      'DOA=DOA'
      'AGE=Age'
      'NOTERMS=NOTERMS'
      'PHONE=Phone'
      'PHOTO=Photo'
      'EML=Eml'
      'M_PHONE=M_Phone'
      'RELIGION=Religion'
      'CASTE=CASTE'
      'F_OCCP=F_occp'
      'F_QUAL=F_qual'
      'M_QUAL=M_qual'
      'M_OCCP=M_occp'
      'SCHLAST=SchLast'
      'BLOODGROUP=BloodGroup'
      'HOUSE=House'
      'MTOUNGE=Mtounge'
      'BYBUS=ByBus'
      'REMARK=Remark'
      'UPGRDYR=UpGrdYr'
      'ADM_CL=ADM_CL'
      'PATH=PATH'
      'Amd_cl_desc=Amd_cl_desc'
      'cl_caption=cl_caption'
      'catDesc=catDesc'
      'stMfee=stMfee'
      'stClDesc=stClDesc'
      'cage=cage'
      'dbfilterstr=dbfilterstr'
      'FEE_PROF_CODE=FEE_PROF_CODE'
      'FEE_PROF_DESCR=FEE_PROF_DESCR'
      'NOFSB=NofSB'
      'G_OCCP=G_OCCP'
      'G_QUAL=G_QUAL'
      'GREL=GREL'
      'GCOMP=GCOMP'
      'CMP_PNO=CMP_PNO'
      'CMP_DEPT=CMP_DEPT'
      'RelDescr=RelDescr'
      'comp=comp'
      'BSDT=BSDT'
      'LIBFINE=LIBFINE'
      'TRANSMODE=TRANSMODE'
      'FSERVADDR=FSERVADDR'
      'MSERVADDR=MSERVADDR'
      'GSERVADDR=GSERVADDR'
      'handicap=handicap'
      'idmark=idmark'
      'disease=disease'
      'handicapDescr=handicapDescr'
      'tc_status=tc_status'
      'tcStatDescr=tcStatDescr'
      'uidno=uidno'
      'NSO=NSO'
      'M_PHONE1=M_PHONE1'
      'nso_dt=nso_dt')
    OpenDataSource = False
    DataSource = studmastS
    BCDToCurrency = False
    Left = 528
    Top = 557
  end
  object qryBoucneChqDet: TMyQuery
    Connection = myconn
    SQL.Strings = (
      
        'select f.studid,noterm,fee_amt,drawn_on,chq_no,CHQ_AMT,f.mr_no,M' +
        'R_DATE,am.AC_CODE,am.AC_NAME ,'
      
        'fd.AC_AMTPAID,s.NAME,b.DESCR bank,br.DESCR branch,c.CLCAPTION cl' +
        'ass,s.SECTION'
      'from fee f '
      'inner join fee_detail fd on f.MR_NO=fd.MR_NO'
      'inner join ac_master am on fd.AC_NO=am.AC_NO '
      'left join bmast b on f.DRAWN_ON=b.BCODE'
      'left join brmast br on f.BRANCH=br.BCODE'
      'inner join studmast s on f.STUDID=s.STUDID'
      'inner join clmast c on s.CLCODE=c.CLCODE'
      'where mr_date between :sdt and :edt and adhoc=2 '
      'order by drawn_on,chq_no')
    Left = 760
    Top = 808
    ParamData = <
      item
        DataType = ftDate
        Name = 'sdt'
        ParamType = ptInput
        Value = 40909d
      end
      item
        DataType = ftDate
        Name = 'edt'
        ParamType = ptInput
        Value = 42255d
      end>
    object qryBoucneChqDetstudid: TFloatField
      FieldName = 'studid'
    end
    object qryBoucneChqDetnoterm: TFloatField
      FieldName = 'noterm'
    end
    object qryBoucneChqDetfee_amt: TFloatField
      FieldName = 'fee_amt'
    end
    object qryBoucneChqDetdrawn_on: TSmallintField
      FieldName = 'drawn_on'
    end
    object qryBoucneChqDetchq_no: TStringField
      FieldName = 'chq_no'
    end
    object qryBoucneChqDetCHQ_AMT: TFloatField
      FieldName = 'CHQ_AMT'
    end
    object qryBoucneChqDetmr_no: TStringField
      FieldName = 'mr_no'
      Size = 14
    end
    object qryBoucneChqDetMR_DATE: TDateField
      FieldName = 'MR_DATE'
    end
    object qryBoucneChqDetAC_CODE: TStringField
      FieldName = 'AC_CODE'
      Size = 9
    end
    object qryBoucneChqDetAC_NAME: TStringField
      FieldName = 'AC_NAME'
    end
    object qryBoucneChqDetAC_AMTPAID: TFloatField
      FieldName = 'AC_AMTPAID'
    end
    object qryBoucneChqDetNAME: TStringField
      FieldName = 'NAME'
      Size = 40
    end
    object qryBoucneChqDetbank: TStringField
      FieldName = 'bank'
      Size = 30
    end
    object qryBoucneChqDetbranch: TStringField
      FieldName = 'branch'
      Size = 30
    end
    object qryBoucneChqDetclass: TStringField
      FieldName = 'class'
      Size = 10
    end
    object qryBoucneChqDetSECTION: TStringField
      FieldName = 'SECTION'
      Size = 2
    end
  end
  object frxDBqryBoucneChqDet: TfrxDBDataset
    UserName = 'frxDBqryBoucneChqDet'
    CloseDataSource = False
    FieldAliases.Strings = (
      'studid=studid'
      'noterm=noterm'
      'fee_amt=fee_amt'
      'drawn_on=drawn_on'
      'chq_no=chq_no'
      'CHQ_AMT=CHQ_AMT'
      'mr_no=mr_no'
      'MR_DATE=MR_DATE'
      'AC_CODE=AC_CODE'
      'AC_NAME=AC_NAME'
      'AC_AMTPAID=AC_AMTPAID'
      'NAME=NAME'
      'bank=bank'
      'branch=branch'
      'class=class'
      'SECTION=SECTION')
    OpenDataSource = False
    DataSet = qryBoucneChqDet
    BCDToCurrency = False
    Left = 864
    Top = 800
  end
  object dsSmslog: TMyDataSource
    DataSet = smslog
    Left = 489
    Top = 648
  end
  object smslog: TMyTable
    TableName = 'smslog'
    Connection = myconn
    Left = 544
    Top = 656
    object smslogid: TIntegerField
      FieldName = 'id'
    end
    object smslogdtime: TDateTimeField
      FieldName = 'dtime'
    end
    object smslogmessage: TStringField
      FieldName = 'message'
      Size = 300
    end
    object smslogreclist: TMemoField
      FieldName = 'reclist'
      BlobType = ftMemo
    end
    object smslognumsms: TIntegerField
      FieldName = 'numsms'
    end
  end
  object adhocfee: TMyTable
    TableName = 'adhocfee'
    Connection = myconn
    Left = 760
    Top = 736
    object adhocfeeslno: TIntegerField
      FieldName = 'slno'
    end
    object adhocfeestudid: TLargeintField
      FieldName = 'studid'
    end
    object adhocfeeac_no: TIntegerField
      FieldName = 'ac_no'
    end
    object adhocfeeamount: TFloatField
      FieldName = 'amount'
    end
    object adhocfeedt: TDateField
      FieldName = 'dt'
    end
    object adhocfeepaid: TBooleanField
      FieldName = 'paid'
    end
    object adhocfeemr_no: TStringField
      FieldName = 'mr_no'
      Size = 14
    end
    object adhocfeestudname: TStringField
      FieldKind = fkLookup
      FieldName = 'studname'
      LookupDataSet = studmast
      LookupKeyFields = 'STUDID'
      LookupResultField = 'NAME'
      KeyFields = 'studid'
      Lookup = True
    end
    object adhocfeeacname: TStringField
      FieldKind = fkLookup
      FieldName = 'acname'
      LookupDataSet = tbAcMaster
      LookupKeyFields = 'AC_NO'
      LookupResultField = 'AC_NAME'
      KeyFields = 'ac_no'
      Lookup = True
    end
  end
  object dsAdhocfee: TMyDataSource
    DataSet = adhocfee
    Left = 688
    Top = 736
  end
  object myExec: TMyCommand
    Connection = myconn
    Left = 528
    Top = 464
  end
  object frxDBtbfee: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'frxDBtbfee'
    CloseDataSource = False
    FieldAliases.Strings = (
      'MR_NO=MR_NO'
      'MR_DATE=MR_DATE'
      'NOTERM=NOTERM'
      'FEE_AMT=FEE_AMT'
      'CASH=CASH'
      'CHQ_NO=CHQ_NO'
      'LATE_FEE=LATE_FEE'
      'STUDID=STUDID'
      'studname=studname'
      'SEC=SEC'
      'tot_terms=tot_terms'
      'tot_amt=tot_amt'
      'STD=STD'
      'CLDESC=CLDESC'
      'DRAWN_ON=DRAWN_ON'
      'CHQ_AMT=CHQ_AMT'
      'BRANCH=BRANCH'
      'BDESC=BDESC'
      'BRDESC=BRDESC'
      'BILLNO=BILLNO'
      'TERM=TERM'
      'ADMNO=ADMNO'
      'Admn=Admn'
      'FEE_PROF_CODE=FEE_PROF_CODE'
      'adhoc=adhoc')
    DataSource = tbfeeS
    BCDToCurrency = False
    Left = 920
    Top = 360
  end
  object frxDBtbfeeDetailS: TfrxDBDataset
    UserName = 'frxDBtbfeeDetailS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'MR_NO=MR_NO'
      'AC_NO=AC_NO'
      'AC_AMT=AC_AMT'
      'AC_NAME=AC_NAME'
      'AC_AMTPAID=AC_AMTPAID')
    DataSource = tbfeeDetailS
    BCDToCurrency = False
    Left = 952
    Top = 296
  end
end
