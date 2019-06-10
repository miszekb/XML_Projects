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
						Auta posortowane według daty ogłoszenia (od najwcześniejszego)
					</fo:block>
					<fo:table break-after="page" table-layout="fixed" font-size="10pt" border-width="thin" background-color= "#fff5cc"> 
						<fo:table-column column-width="22px"/> 
						<fo:table-column column-width="60px"/>
						<fo:table-column column-width="auto"/>
						<fo:table-column column-width="auto"/>
						<fo:table-column column-width="autp"/>
						<fo:table-column column-width="45px"/>
						<fo:table-column column-width="56px"/>
						<fo:table-column column-width="auto"/>
						<fo:table-column column-width="40px"/>
						<fo:table-column column-width="auto"/>
						<fo:table-header text-align="center" background-color= "#ffd11a">
							<fo:table-row>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid"> 
									<fo:block font-weight="bold">Lp.</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Marka</fo:block>
								</fo:table-cell>
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
									<fo:block font-weight="bold">Przebieg [km]</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Rodzaj silnika</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Pojemność silnika [l]</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Cena [zł]</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Data ogłoszenia</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<xsl:for-each select="//samochód">
								<fo:table-row>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="LP_auta"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="Marka_nazwa"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="Model"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="Rocznik"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="Typ"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="Przebieg"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="Rodzaj_silnika"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="Pojemność"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="Cena"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="Data_ogłoszenia"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
					<fo:block text-align="center" font-size="13pt" margin-top="20px" font-weight="bold">
						Marki aut posortowane według ilości aut
					</fo:block>
					<fo:table table-layout="fixed" font-size="10pt" border-width="thin" background-color= "#fff5cc">
						<fo:table-column column-width="22px"/>
						<fo:table-column column-width="60px"/>
						<fo:table-column column-width="auto"/>
						<fo:table-column column-width="auto"/>
						<fo:table-column column-width="autp"/>
						<fo:table-header text-align="center" background-color= "#ffd11a">
							<fo:table-row>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Lp.</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Koncern</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Rok założenia</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Ilość aut</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
									<fo:block font-weight="bold">Suma cen [zł]</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<xsl:for-each select="//marka">
								<fo:table-row>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="Lp_marki"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="Koncern"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="Rok_założenia"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="Liczba_aut_marki"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block>
											<xsl:value-of select="Suma_cen_aut"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
					<fo:block text-align="center" font-size="13pt" margin-top="20px" font-weight="bold">
					Dodatkowe fakty
					</fo:block>
						<fo:block text-align="center" font-size="10pt">
						<fo:table text-align="center" table-layout="inherit" font-size="10pt" border-width="thin" background-color= "white">
							<fo:table-column column-width="120px"/>
							<fo:table-column column-width="300px"/>
							<fo:table-header text-align="center" background-color= "#ffd11a">
								<fo:table-row>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block font-weight="bold"> Dana </fo:block>
									</fo:table-cell>
									<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
										<fo:block font-weight="bold">Wartość</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-header>
							<fo:table-body>
									<fo:table-row>
										<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
											<fo:block>
												Ilość wszystkich aut
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
											<fo:block>
												<xsl:value-of select="//Liczba_wszystkich_aut"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
											<fo:block>
												Suma cen wszystkich aut
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
											<fo:block>
												<xsl:value-of select="//Suma_cen_wszystkich_aut"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
											<fo:block>
											Ilość volkwagenów
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
											<fo:block>
												<xsl:value-of select="//Liczba_volkswagenów"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
											<fo:block>
											Najstarsze auto
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
											<fo:block>
												<xsl:value-of select="//Najstarsze_auto"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
											<fo:block>
											Najmłodsze auto
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding="1mm" border-width="thin" border-style="solid">
											<fo:block>
												<xsl:value-of select="//Najmłodsze_auto"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
					<fo:block text-align="center" font-size="13pt" margin-top="40px" font-weight="bold">
						Czas wygenerowania raportu:
					</fo:block>
					<fo:block text-align="center" font-size="13pt" margin-top="10px">
					<xsl:value-of select="//Data_wygenerowania_raportu"/>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>