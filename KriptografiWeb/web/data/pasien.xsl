<?xml version="1.0" encoding="iso-8859-1"?>
<!-- Nama File	: xslpasien.xsl, utk menampilkan file pasien.xml
Fungsi			: Menampilkan data umum pelayanan pasien -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/TR/WD-xsl">
	<xsl:template match="/">
		<H1 ALIGN="CENTER"><xsl:value-of select="PELAYANANPASIEN/DATARUMAHSAKIT/NAMARUMAHSAKIT"/><BR/></H1>
		<H2 ALIGN="CENTER" ><SPAN>KOTA</SPAN>
		<xsl:value-of select="PELAYANANPASIEN/DATARUMAHSAKIT/KOTA"/></H2>
		<H3 ALIGN="CENTER"><xsl:value-of select="PELAYANANPASIEN/DATARUMAHSAKIT/ALAMAT"/><BR/>
		<SPAN>TELP: </SPAN>
		<xsl:value-of select="PELAYANANPASIEN/DATARUMAHSAKIT/TELEPON"/></H3><BR/><BR/>
		<SPAN>PERIHAL:</SPAN>
		<xsl:value-of select="PELAYANANPASIEN/DATARUMAHSAKIT/PRODUK"/><BR/>
		<SPAN>PERIODE      :</SPAN>
		<xsl:value-of select="PELAYANANPASIEN/DATARUMAHSAKIT/PERIODE"/><BR/>
		
		<H3>DATA UMUM PELAYANAN PASIEN</H3>
		
	<!--	<xsl:for-each select="PELAYANANPASIEN/DATAPASIEN">
		
			<SPAN STYLE="font-style:oblique">NO. INDUK PASIEN		:</SPAN>
			<xsl:value-of select="NOMORINDUKPASIEN"/><BR/>
			<SPAN STYLE="font-style:oblique">NAMA PASIEN    		:</SPAN>
			<xsl:value-of select="nama"/><BR/>
			<SPAN STYLE="font-style:oblique">NO. IDENTITAS			:</SPAN>
			<xsl:value-of select="NOMORIDENTITAS"/><BR/>
			<SPAN STYLE="font-style:oblique">TEMPAT DAN TGL LAHIR	:</SPAN>
			<xsl:value-of select="TEMPATTANGGALLAHIR"/><BR/>
			<SPAN STYLE="font-style:oblique">JENIS KELAMIN			:</SPAN>
			<xsl:value-of select="JENISKELAMIN"/><BR/>
			<SPAN STYLE="font-style:oblique">GOLONGAN DARAH			:</SPAN>
			<xsl:value-of select="GOLONGANDARAH"/><BR/>
			<SPAN STYLE="font-style:oblique">TINGGI DAN BERAT BADAN	:</SPAN>
			<xsl:value-of select="TINGGIDANBERATBADAN"/><BR/>
			<SPAN STYLE="font-style:oblique">ALAMAT RUMAH			:</SPAN>
			<xsl:value-of select="alamat"/><BR/>
			<SPAN STYLE="font-style:oblique">TELEPON PASIEN			:</SPAN>
			<xsl:value-of select="TELEPONPASIEN"/><BR/>
			<SPAN STYLE="font-style:oblique">PEKERJAAN				:</SPAN>
			<xsl:value-of select="PEKERJAANPASIEN"/><BR/>
			<SPAN STYLE="font-style:oblique">PENYAKIT				:</SPAN>
			<xsl:value-of select="PENYAKIT"/><BR/>
			<SPAN STYLE="font-style:oblique">MULAI SAKIT			:</SPAN>
			<xsl:value-of select="MULAISAKIT"/><BR/>
			<SPAN STYLE="font-style:oblique">ALERGI OBAT			:</SPAN>
			<xsl:value-of select="ALERGIOBAT"/><BR/>
			<SPAN STYLE="font-style:oblique">RIWAYAT PENYAKIT		:</SPAN>
			<xsl:value-of select="RIWAYATPENYAKIT"/><BR/>
			<P/>
		</xsl:for-each>
		-->
    </xsl:template>
</xsl:stylesheet>
