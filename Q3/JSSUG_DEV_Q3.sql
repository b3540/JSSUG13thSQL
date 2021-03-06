USE [JSSUG_DEV]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Fn_ChangeFullWidthToHalfWidth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'


CREATE FUNCTION [dbo].[Fn_ChangeFullWidthToHalfWidth](@str varchar(512))
	RETURNS varchar(512)
AS
BEGIN
	--Arithmetic operator conversion
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''×'', ''*'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''÷'', ''/'')
	
	--The order in accordance with ASCII(20-126)
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''　'', '' '')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''！'', ''!'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''”'', ''"'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''＃'', ''#'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''＄'', ''$'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''％'', ''%'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''＆'', ''&'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''’'', '''''''')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''（'', ''('')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''）'', '')'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''＊'', ''*'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''＋'', ''+'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''，'', '','')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''−'', ''-'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''．'', ''.'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''／'', ''/'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''０'', ''0'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''１'', ''1'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''２'', ''2'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''３'', ''3'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''４'', ''4'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''５'', ''5'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''６'', ''6'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''７'', ''7'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''８'', ''8'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''９'', ''9'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''：'', '':'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''；'', '';'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''＜'', ''<'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''＝'', ''='')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''＞'', ''>'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''?'', ''?'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''＠'', ''@'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ａ'', ''A'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｂ'', ''B'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｃ'', ''C'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｄ'', ''D'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｅ'', ''E'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｆ'', ''F'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｇ'', ''G'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｈ'', ''H'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｉ'', ''I'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｊ'', ''J'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｋ'', ''K'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｌ'', ''L'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｍ'', ''M'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｎ'', ''N'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｏ'', ''O'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｐ'', ''P'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｑ'', ''Q'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｒ'', ''R'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｓ'', ''S'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｔ'', ''T'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｕ'', ''U'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｖ'', ''V'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｗ'', ''W'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｘ'', ''X'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｙ'', ''Y'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''Ｚ'', ''Z'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''｀'', ''`'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ａ'', ''a'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｂ'', ''b'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｃ'', ''c'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｄ'', ''d'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｅ'', ''e'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｆ'', ''f'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｇ'', ''g'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｈ'', ''h'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｉ'', ''i'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｊ'', ''j'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｋ'', ''k'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｌ'', ''l'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｍ'', ''m'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｎ'', ''n'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｏ'', ''o'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｐ'', ''p'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｑ'', ''q'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｒ'', ''r'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｓ'', ''s'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｔ'', ''t'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｕ'', ''u'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｖ'', ''v'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｗ'', ''w'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｘ'', ''x'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｙ'', ''y'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''ｚ'', ''z'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''｛'', ''{'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''｜'', ''|'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''｝'', ''}'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''￣'', ''~'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''・'', ''+'')
	SET @str = REPLACE(@str COLLATE Japanese_BIN, ''〜'', ''+'')
	--Trim the result
	SET @str = REPLACE(@str COLLATE Japanese_BIN, '' '', '''')
	
	--Return the result
	RETURN @str
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SKU]') AND type in (N'U'))
	DROP TABLE dbo.SKU
	
CREATE TABLE [dbo].[SKU](
	[Sku] [varchar](7) NOT NULL,
	[SkuDesc] [varchar](60) NOT NULL,
	[SkuWeightDesc] [varchar](60) NOT NULL,
	[SkuWeight] [float] NOT NULL,
 CONSTRAINT [PK_SKU] PRIMARY KEY CLUSTERED 
(
	[Sku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000001', N'商品00', N'４００ｇ（３〜４人前）　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000002', N'商品01', N'１袋（３００ｇ）　　　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000003', N'商品02', N'１４０ｇ（７０ｇ×２袋）　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000004', N'商品03', N'８０ｇ×２　　　　　　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000005', N'商品04', N'４５ｇ×３（たれ・からし付）　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000006', N'商品05', N'２２０ｇ　　　　　　　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000007', N'商品06', N'８０ｇ（標準５枚入）×２　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000008', N'商品07', N'１６コ（２４０ｇ）　　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000009', N'商品08', N'１２６ｇ（７枚）　　　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000010', N'商品09', N'８本入（１７２ｇ）　　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000011', N'商品0A', N'７０ｇ（標準５枚入）　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000012', N'商品0B', N'８８０ｇ＋５０ｇ　　　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000013', N'商品0C', N'３種１０コ（２１０ｇ）　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000014', N'商品0D', N'４０ｇ×２（たれ・からし付き）', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000015', N'商品0E', N'１００ｇ×３　　　　　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000016', N'商品0F', N'１３０ｇ＋１３ｇ　　　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000017', N'商品10', N'３６０ｇ（めん１５０ｇ×２）　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000018', N'商品11', N'（１５０ｇ×２）×２　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000019', N'商品12', N'１５０ｇ×５×２種　　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000020', N'商品13', N'２００ｇ（固形量１２０ｇ）×２', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000021', N'商品14', N'２６０ｇ（２６ｇ×１０コ）　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000022', N'商品15', N'１７０ｇ（２〜３人前）×２　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000023', N'商品16', N'業務用　８５０ｇ（５０コ）　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000024', N'商品17', N'豚肉から揚げ１２０ｇ・たれ８０', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000025', N'商品18', N'２１０ｇ（標準１５〜１８コ入）', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000026', N'商品19', N'３００ｇ（約１５０ｇ×２）　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000027', N'商品1A', N'５００ｇ（約１１〜１４本）　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000028', N'商品1B', N'（三杯酢）８０ｇ×３　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000029', N'商品1C', N'１００ｇ（１９〜２２尾）　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000030', N'商品1D', N'８尾（１６８ｇ）　　　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000031', N'商品1E', N'１枚（７０ｇ）　　　　　　　　', 0)
GO
INSERT [dbo].[SKU] ([Sku], [SkuDesc], [SkuWeightDesc], [SkuWeight]) VALUES (N'0000032', N'商品1F', N'０．５ｋｇ（約１１〜１４本）　', 0)
GO