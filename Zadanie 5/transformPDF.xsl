<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
	<xsl:output method="xml" version="1.0" indent="yes" encoding="UTF-8"/> 
	<xsl:template match="/"> 
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format"> 
			<fo:layout-master-set>
				<fo:simple-page-master page-height="297mm" page-width="210mm" margin="5mm 15mm 5mm 15mm" master-name="moja-strona">
					<fo:region-body margin="20mm 0mm 20mm 0mm"/> 
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="moja-strona"> 
				<fo:flow flow-name="xsl-region-body"> 
					<fo:block text-align="left" font-size="10pt" margin-bottom="40px">
						Przeglądasz obecnie bazę samochodów wraz z ich podstawowymi parametrami
						sporządzoną w ramach przedmiotu "Programowanie Komunikacji Człowiek-Komputer".
						Dane pochodzą z serwisu z ogłoszeniami otomoto.pl
					</fo:block> 	
				
					<fo:block text-align="center" font-size="13pt" margin-top="20px" font-weight="bold">
						Baza marek
					</fo:block>
					<fo:table table-layout="fixed" font-size="10pt" border-width="thin" background-color= "#fff5cc">
						<fo:table-column column-width="22px"/>
						<fo:table-column column-width="60px"/>
						<fo:table-column column-width="auto"/>
						<fo:table-header text-align="center" background-color= "#ffd11a">
							<fo:table-row>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">ID</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Koncern</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Rok założenia</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<xsl:for-each select="//marka">
								<fo:table-row>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="./@markaID"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="koncern"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="rok_założenia"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
					<fo:block text-align="center" font-size="13pt" margin-top="20px" font-weight="bold">
						Baza samochodów
					</fo:block>
					<fo:table table-layout="fixed" font-size="10pt" border-width="thin" background-color= "#fff5cc">
						<fo:table-column column-width="22px"/>
						<fo:table-column column-width="60px"/>
						<fo:table-column column-width="auto"/>
						<fo:table-header text-align="center" background-color= "#ffd11a">
							<fo:table-row>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Model</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Rocznik</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Typ</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Przebieg</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Rodzaj silnika</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Pojemność silnika</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Cena</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Data</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<xsl:for-each select="//samochód">
								<fo:table-row>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="model"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="rocznik"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="typ"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="przebieg"/>
										</fo:block>
									</fo:table-cell><fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block>
										<xsl:value-of select="rodzaj_silnika"/>
									</fo:block>
								</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="pojemność_silnika"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="cena"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="data_umieszczenia_ogłoszenia"/>
										</fo:block>
									</fo:table-cell>

								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
					
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>