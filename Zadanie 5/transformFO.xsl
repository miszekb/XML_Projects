<?xml version="1.0" encoding="UTF-8"?><fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
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
            <fo:table table-layout="fixed" font-size="10pt" border-width="thin" background-color="#fff5cc">
                <fo:table-column column-width="22px"/>
                <fo:table-column column-width="60px"/>
                <fo:table-column column-width="auto"/>
                <fo:table-header text-align="center" background-color="#ffd11a">
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
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M1</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Volkswagen</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1931</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M2</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>BMW</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1916</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M3</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Toyota</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1937</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M4</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Audi</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1909</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M5</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Mini</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1959</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M6</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Jaguar</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1922</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M8</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Fiat</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1899</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M9</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Porsche</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1931</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M11</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Subaru</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1953</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M12</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Mazda</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1920</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M13</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Skoda</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1895</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M14</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Opel</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1862</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M16</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Nissan</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1933</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M17</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Jeep</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1941</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M18</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Iveco</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1975</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M19</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Man</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1758</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>M20</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>Chevrolet</fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="thin" border-style="solid">
                            <fo:block>1911</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:flow>
    </fo:page-sequence>
</fo:root>
